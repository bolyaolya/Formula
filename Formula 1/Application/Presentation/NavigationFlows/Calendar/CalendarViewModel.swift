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
    var trackSchemes: [String: UIImage] { get set }
    var isLoading: Bool { get }
}

// MARK: - CalendarViewModel implementation

final class ICalendarViewModel: CalendarViewModel {
    @ReferenceCounted private var coordinator: UnownedRouter<CalendarDestination>
    
    @Published var races: [Race] = []
    @Published var trackSchemes: [String: UIImage] = [:]
    @Published var isLoading: Bool = true
    
    private let imageRepository: ImageRepositoryProtocol = ImageRepository()
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<CalendarDestination>) {
        self.coordinator = coordinator
        fetchCircuits()
    }
    
    // MARK: Methods
    
    private func fetchCircuits() {
        Task {
            do {
                let fetchedCircuits = try await NetworkManager().raceSchedule(for: .currentYear)
                self.races = fetchedCircuits.data.raceTable.races
                self.fetchDriversPhotos()
            } catch {
                print("Ошибка загрузки данных о трассе: \(error.localizedDescription)")
            }
        }
        isLoading = false
    }
    
    private func fetchDriversPhotos() {
        Task {
            for race in races {
                do {
                    let path = "trackSchemes/\(race.circuit.circuitID).png"
                    let imageData = try await imageRepository.fetchImageData(imageID: race.circuit.circuitID, path: path)
                    DispatchQueue.main.async {
                        self.trackSchemes[race.circuit.circuitID] = UIImage(data: imageData) ?? UIImage()
                    }
                } catch {
                    print("Error fetching track schemes: \(error)")
                }
            }
        }
    }
}
