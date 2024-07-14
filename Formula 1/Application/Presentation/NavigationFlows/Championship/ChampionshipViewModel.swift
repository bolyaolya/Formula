//
//  ChampionshipViewModel.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import SwiftUI

// MARK: - ChampionshipViewModel Protocol

protocol ChampionshipViewModel: ObservableObject { }

extension ChampionshipViewModel { }

// MARK: - ChampionshipViewModel implementation

final class IChampionshipViewModel: ChampionshipViewModel {
    
    @ReferenceCounted private var coordinator: UnownedRouter<ChampionshipDestination>
    
    
    // MARK: Private properties
    
    
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<ChampionshipDestination>) {
        self.coordinator = coordinator
    }
    
    
}
