//
//  RaceViewModel.swift
//  Formula 1
//
//  Created by Olya B on 05.06.2024.
//

import SwiftUI

// MARK: - RaceViewModel Protocol

protocol RaceViewModel: ObservableObject {
    var dateStart: String { get set }
    var dateEnd: String { get set }
    var raceName: String { get set }
    var countryFlag: UIImage { get set }
    
    var daysLeft: Int { get set }
    var hoursLeft: Int { get set }
    var minutesLeft: Int { get set }
}

extension RaceViewModel { }

// MARK: - RaceViewModel implementation

final class IRaceViewModel: RaceViewModel {
    
    @ReferenceCounted private var coordinator: UnownedRouter<RaceViewDestination>
    
    @Published var dateStart: String = ""
    @Published var dateEnd: String = ""
    @Published var raceName: String = ""
    @Published var countryFlag: UIImage = UIImage()
    
    @Published var daysLeft: Int = 0
    @Published var hoursLeft: Int = 0
    @Published var minutesLeft: Int = 0
    
    // MARK: Private properties
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<RaceViewDestination>) {
        self.coordinator = coordinator
        
        fetchNextRaceWeekend()
    }
    
    //MARK: Methods
    
    func fetchNextRaceWeekend() {
        Task {
            do {
                let raceSchedule = try await NetworkManager().raceSchedule(for: .currentYear)
                
                guard let race = raceSchedule.data.raceTable.races.first(where: {
                    guard let raceDate = DateFormatter.fetchedDateFormatter.date(from: $0.date) else { return false }
                    return raceDate > Date()
                }) else {
                    print("No upcoming races found for the current year.")
                    return
                }
                
                await updateRaceDetails(from: race)
                
                let raceLatitude = Double(race.circuit.location.lat) ?? 0.0
                let raceLongitude = Double(race.circuit.location.long) ?? 0.0
                
                fetchTimeZone(latitude: raceLatitude, longitude: raceLongitude) { timeZone in
                    guard let timeZone = timeZone else {
                        print("Failed to get time zone for race location.")
                        return
                    }
                    self.calculateTimeUntilRaceStart(for: race, userTimeZone: timeZone)
                }
                
            } catch {
                print("Failed to fetch race schedule: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateRaceDetails(from race: Race) async {
        await updateRaceDates(from: race)
        await updateRaceName(from: race.raceName)
        await updateCountryFlag(from: race)
    }
    
    private func updateRaceDates(from race: Race) async {
        DispatchQueue.main.async {
            if let firstPracticeDate = race.firstPractice?.date,
               let formattedFirstPracticeDate = DateFormatter().formattedRussianDate(from: firstPracticeDate) {
                self.dateStart = formattedFirstPracticeDate
            } else {
                print("No first practice data available.")
            }
            
            if let raceDate = DateFormatter().formattedRussianDate(from: race.date) {
                self.dateEnd = raceDate
            } else {
                print("Failed to format race date.")
            }
        }
    }
    
    private func updateRaceName(from raceName: String) async {
        guard !raceName.isEmpty else {
            print("Race name not available.")
            return
        }
        DispatchQueue.main.async {
            self.raceName = RaceLocalization.localizedRaceName(for: raceName)
        }
    }
    
    private func updateCountryFlag(from race: Race) async {
        let raceCountry = race.circuit.location.country
        let countryImageFlag = CountryFlags.countryFlagsImages(for: raceCountry)
        DispatchQueue.main.async {
            self.countryFlag = countryImageFlag
        }
    }
    
    private func fetchTimeZone(latitude: Double, longitude: Double, completion: @escaping (TimeZone?) -> Void) {
        guard let url = URL(string: "http://api.geonames.org/timezoneJSON?lat=\(latitude)&lng=\(longitude)&username=olyabolya")
        else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let timeZoneInfo = try decoder.decode(TimeZoneInfo.self, from: data)
                let timeZone = TimeZone(identifier: timeZoneInfo.timezoneId)
                completion(timeZone)
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    private func calculateTimeUntilRaceStart(for race: Race, userTimeZone: TimeZone) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = userTimeZone
        
        guard let raceDate = dateFormatter.date(from: "\(race.date)T\(race.time)") else {
            print("Failed to parse race start date.")
            return
        }
        
        let currentDate = Date()
        
        guard raceDate > currentDate else {
            print("Race already started or start time is in the past.")
            return
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: currentDate, to: raceDate)
        
        guard let days = components.day,
              let hours = components.hour,
              let minutes = components.minute else {
            print("Failed to calculate countdown components.")
            return
        }
        
        DispatchQueue.main.async {
            self.daysLeft = days
            self.hoursLeft = hours
            self.minutesLeft = minutes
        }
    }
}
