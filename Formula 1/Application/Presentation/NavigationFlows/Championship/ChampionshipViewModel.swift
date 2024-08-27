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
    var teams: [ConstructorStanding] { get }
    var drivers: [DriverStanding] { get }
    var constructorPhotos: [String: UIImage] { get set }
    var driverPhotos: [String: UIImage] { get set }
    
    var isLoading: Bool { get }
}

// MARK: - ChampionshipViewModel implementation

final class IChampionshipViewModel: ChampionshipViewModel {
    @ReferenceCounted private var coordinator: UnownedRouter<ChampionshipDestination>
    
    @Published var teams: [ConstructorStanding] = []
    @Published var drivers: [DriverStanding] = []
    @Published var constructorPhotos: [String: UIImage] = [:]
    @Published var driverPhotos: [String: UIImage] = [:]
    
    @Published var isLoading: Bool = false
    
    // MARK: Private properties
    
    private let imageRepository: ImageRepositoryProtocol = ImageRepository()
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<ChampionshipDestination>) {
        self.coordinator = coordinator
        
        fetchDriversStandings()
        fetchConstructorStandings()
    }
    
    // MARK: Methods
    
    private func fetchDriversStandings() {
        isLoading = true
        
        Task {
            do {
                let season = Season.currentYear
                let driverStandings = try await NetworkManager.driverStandings(for: season)
                
                self.drivers = driverStandings.data.standingsTable.standingsLists.first?.driverStandings ?? []
                self.fetchDriversPhotos()
                self.isLoading = false
            } catch {
                print("Error fetching driver standings: \(error)")
                self.isLoading = false
            }
        }
    }
    
    private func fetchConstructorStandings() {
        isLoading = true
        
        Task {
            do {
                let season = Season.currentYear
                let constructorStandings = try await NetworkManager.constructorStandings(for: season)
                
                self.teams = constructorStandings.data.standingsTable.standingsLists.first?.constructorStandings ?? []
                self.fetchTeamsPhotos()
                self.isLoading = false
            } catch {
                print("Error fetching teams standings: \(error)")
                self.isLoading = false
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
    
    private func fetchTeamsPhotos() {
        Task {
            for team in teams {
                do {
                    let path = "teams/\(team.constructor.constructorID).jpg"
                    let imageData = try await imageRepository.fetchImageData(imageID: team.constructor.constructorID, path: path)
                    
                    DispatchQueue.main.async {
                        self.constructorPhotos[team.constructor.constructorID] = UIImage(data: imageData) ?? UIImage()
                    }
                } catch {
                    print("Error fetching team's avatar: \(error)")
                }
            }
        }
    }
}
