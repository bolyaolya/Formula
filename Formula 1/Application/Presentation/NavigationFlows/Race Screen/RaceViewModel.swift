//
//  RaceViewModel.swift
//  Formula 1
//
//  Created by Olya B on 05.06.2024.
//

import SwiftUI

// MARK: - RaceViewModel Protocol

protocol RaceViewModel: ObservableObject, HostedViewConfigurable {
    var dateStart: String { get set }
    var dateEnd: String { get set }
    var raceName: String { get set }
    var countryFlag: UIImage { get set }
    
    var daysLeft: Int { get set }
    var hoursLeft: Int { get set }
    var minutesLeft: Int { get set }
    
    var firstPracticeDate: String { get set }
    var secondPracticeDate: String { get set }
    var thirdPracticeDate: String { get set }
    
    var firstPracticeTime: String { get set }
    var secondPracticeTime: String { get set }
    var thirdPracticeTime: String { get set }
    
    var sprintQualificationDate: String? { get set }
    var sprintQualificationTime: String? { get set }
    var sprintDate: String? { get set }
    var sprintTime: String? { get set }
    
    var qualificationDate: String { get set }
    var qualificationTime: String { get set }
    
    var raceDate: String { get set }
    var raceTime: String { get set }
    
    var isLoading: Bool { get }
    
    func calculateTimeUntilRaceStart()
}

extension RaceViewModel {
    func calculateTimeUntilRaceStart() {}
}

// MARK: - RaceViewModel implementation

final class IRaceViewModel: RaceViewModel {
    var configuration: (any HostedViewConfiguring)?
    
    @ReferenceCounted private var coordinator: UnownedRouter<RaceViewDestination>
    
    @Published var dateStart: String = ""
    @Published var dateEnd: String = ""
    @Published var raceName: String = ""
    @Published var countryFlag: UIImage = UIImage()
    
    @Published var daysLeft: Int = 0
    @Published var hoursLeft: Int = 0
    @Published var minutesLeft: Int = 0
    
    @Published var firstPracticeDate: String = ""
    @Published var secondPracticeDate: String = ""
    @Published var thirdPracticeDate: String = ""
    
    @Published var firstPracticeTime: String = ""
    @Published var secondPracticeTime: String = ""
    @Published var thirdPracticeTime: String = ""
    
    @Published var sprintQualificationDate: String?
    @Published var sprintQualificationTime: String?
    @Published var sprintDate: String?
    @Published var sprintTime: String?
    
    @Published var qualificationDate: String = ""
    @Published var qualificationTime: String = ""
    
    @Published var raceDate: String = ""
    @Published var raceTime: String = ""
    
    @Published var isLoading: Bool = true
    
    // MARK: Private properties
    
    private var race: Race?
    private var timer: Timer?
    private let locationManager = LocationManager()
    private var userTimeZone = TimeZone.autoupdatingCurrent
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<RaceViewDestination>) {
        self.coordinator = coordinator
        
        fetchNextRaceWeekend()
    }
    
    // MARK: Methods
    
    private func fetchNextRaceWeekend() {
        Task {
            do {
                let raceSchedule = try await NetworkManager().raceSchedule(for: .currentYear)
                
                guard let race = raceSchedule.data.raceTable.races.first(where: {
                    guard let raceDate = DateFormatter.fetchedDateFormatter.date(from: $0.date) else { return false }
                    let endOfRaceDay = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: raceDate) ?? raceDate
                    return endOfRaceDay >= Date()
                }) else {
                    print("No upcoming races found for the current year.")
                    return
                }
                
                self.race = race
                
                await updateRaceDetails(from: race)
                self.startTimer()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isLoading = false
                }
            } catch let DecodingError.dataCorrupted(context) {
                print("Data corrupted: \(context.debugDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            } catch {
                print("Failed to fetch race schedule: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
    
    private func startTimer() {
        self.timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.calculateTimeUntilRaceStart()
        }
        timer?.fire()
    }
    
    private func updateRaceDetails(from race: Race) async {
        await updateRaceDates(from: race)
        await updateRaceName(from: race.raceName)
        await updateCountryFlag(from: race)
        await fetchEventsTime(from: race)
    }
    
    private func updateRaceDates(from race: Race) async {
        DispatchQueue.main.async {
            if let firstPractice = race.firstPractice?.date,
               let formattedFirstPracticeDate = DateFormatter().formattedRussianDate(from: firstPractice) {
                self.dateStart = formattedFirstPracticeDate
                self.firstPracticeDate = firstPractice
            } else {
                print("No first practice data available.")
            }
            
            if let secondPractice = race.secondPractice?.date {
                self.secondPracticeDate = secondPractice
            }
            
            if let thirdPractice = race.thirdPractice?.date {
                self.thirdPracticeDate = thirdPractice
            }
            
            if let sprint = race.sprint {
                self.sprintDate = sprint.date
                self.sprintQualificationDate = race.secondPractice?.date
            }
            
            self.qualificationDate = race.qualifying.date
            self.raceDate = race.date
            
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
    
    func calculateTimeUntilRaceStart() {
        guard let race = race else {
            print("Race not set.")
            return
        }
        
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime]
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let raceDateTimeString = "\(race.date)T\(race.time)"
        guard let raceDate = dateFormatter.date(from: raceDateTimeString) else {
            print("Failed to parse race start date: \(raceDateTimeString)")
            return
        }
        
        let currentDate = Date()
        let calendar = Calendar.current
        let endOfRaceDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: raceDate) ?? raceDate
        
        if currentDate < raceDate {
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
        } else if currentDate <= endOfRaceDay {
            DispatchQueue.main.async {
                self.daysLeft = 0
                self.hoursLeft = 0
                self.minutesLeft = 0
            }
        } else {
            print("Race day is over.")
        }
    }
    
    private func fetchEventsTime(from race: Race) async {
        let eventsTimes = [
            (time: race.firstPractice?.time, update: { self.firstPracticeTime = $0 }),
            (time: race.secondPractice?.time, update: { self.secondPracticeTime = $0 }),
            (time: race.thirdPractice?.time, update: { self.thirdPracticeTime = $0 }),
            (time: race.sprintQualy?.time, update: { self.sprintQualificationTime = $0 }),
            (time: race.sprint?.time, update: { self.sprintTime = $0 }),
            (time: race.qualifying.time, update: { self.qualificationTime = $0 }),
            (time: race.time, update: { self.raceTime = $0 })
        ]
        
        for event in eventsTimes {
            if let time = event.time,
               let localTimeString = locationManager.convertToUserTimeZone(dateString: "\(race.date)T\(time)", timeZone: userTimeZone) {
                DispatchQueue.main.async {
                    event.update(localTimeString)
                }
            }
        }
    }
}
