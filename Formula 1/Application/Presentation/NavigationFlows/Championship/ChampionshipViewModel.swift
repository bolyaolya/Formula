//
//  ChampionshipViewModel.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import SwiftUI
import Combine

// MARK: - ChampionshipViewModel Protocol

protocol ChampionshipViewModel: ObservableObject {
    var drivers: [DriverStanding] { get set }
    var driverPhotos: [String: UIImage] { get set }
    
    var isLoading: Bool { get }
}

extension ChampionshipViewModel { }

// MARK: - ChampionshipViewModel implementation

final class IChampionshipViewModel: ChampionshipViewModel {
    @ReferenceCounted private var coordinator: UnownedRouter<ChampionshipDestination>
    
    @Published var drivers: [DriverStanding] = []
    @Published var driverPhotos: [String: UIImage] = [:]
    
    @Published var isLoading: Bool = false
    
    // MARK: Private properties
    
    private let imageRepository = ImageRepository()
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<ChampionshipDestination>) {
        self.coordinator = coordinator
        
        fetchDriversStandings()
    }
    
    // MARK: Methods
    
    func fetchDriversStandings() {
        isLoading = true
        
        Task {
            do {
                let season = Season.currentYear
                let driverStandings = try await NetworkManager.driverStandings(for: season)
                
                DispatchQueue.main.async { [ weak self ] in
                    self?.drivers = driverStandings.data.standingsTable.standingsLists.first?.driverStandings ?? []
                    self?.fetchDriversPhotos()
                    self?.isLoading = false
                }
            } catch {
                print("Error fetching driver standings: \(error)")
                DispatchQueue.main.async { [weak self] in
                    self?.isLoading = false
                }
            }
        }
    }
    
    private func fetchDriversPhotos() {
        Task {
            for driver in drivers {
                do {
                    let path = "drivers/\(driver.driver.driverID).jpg"
                    let imageData = try await imageRepository.fetchImageData(imageID: driver.driver.driverID, path: path)
                    DispatchQueue.main.async {
                        self.driverPhotos[driver.driver.driverID] = UIImage(data: imageData) ?? UIImage()
                    }
                } catch {
                    print("Error fetching driver's avatar: \(error)")
                }
            }
        }
    }
}
