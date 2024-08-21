//
//  CalendarViewModel.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import SwiftUI

// MARK: - CalendarViewModel Protocol

protocol CalendarViewModel: ObservableObject {
    var races: [Race] { get }
    var trackScheme: UIImage { get }
    
    var isLoading: Bool { get }
    
    func trackImage(for countryName: String) -> UIImage
}

extension CalendarViewModel { }

// MARK: - CalendarViewModel implementation

final class ICalendarViewModel: CalendarViewModel {
    @ReferenceCounted private var coordinator: UnownedRouter<CalendarDestination>
    
    @Published var races: [Race] = []
    @Published var trackScheme: UIImage = UIImage()
    
    @Published var isLoading: Bool = true
    
    // MARK: Private properties
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<CalendarDestination>) {
        self.coordinator = coordinator
        
        fetchCircuits()
    }
    
    // MARK: Methods
    
    func trackImage(for countryName: String) -> UIImage {
        return UIImage(named: countryName) ?? UIImage()
    }
    
    private func fetchCircuits() {
        Task {
            do {
                let fetchedCircuits = try await NetworkManager().raceSchedule(for: .currentYear)
                self.races = fetchedCircuits.data.raceTable.races
            } catch {
                print("Ошибка загрузки данных о трассе: \(error.localizedDescription)")
            }
        }
        isLoading = false
    }
}
