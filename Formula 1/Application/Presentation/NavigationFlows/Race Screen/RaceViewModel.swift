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
}

extension RaceViewModel { }

// MARK: - RaceViewModel implementation

final class IRaceViewModel: RaceViewModel {
    
    @ReferenceCounted private var coordinator: UnownedRouter<RaceViewDestination>
    
    @Published var dateStart: String = ""
    @Published var dateEnd: String = ""
    
    // MARK: Private properties
    
//    @Dependency private var networkManager: NetworkManager
    
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
                
                if let raceWeekend = raceSchedule.data.raceTable.races.first(where: { race in
                    guard let raceDate = DateFormatter.fetchedDateFormatter.date(from: race.date) else { return false }
                    return raceDate > Date()
                }) {
                    if let firstPracticeDate = raceWeekend.firstPractice?.date,
                       let formattedFirstPracticeDate = DateFormatter().formattedRussianDate(from: firstPracticeDate) {
                        DispatchQueue.main.async {
                            self.dateStart = formattedFirstPracticeDate
                        }
                    } else {
                        print("No first practice data available.")
                    }
                    
                    if let raceDate = DateFormatter().formattedRussianDate(from: raceWeekend.date) {
                        DispatchQueue.main.async {
                            self.dateEnd = raceDate
                        }
                    } else {
                        print("Failed to format race date.")
                    }
                } else {
                    print("No upcoming races found for the current year.")
                }
            } catch {
                print("Failed to fetch race schedule: \(error.localizedDescription)")
            }
        }
    }
}
