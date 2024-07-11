//
//  RaceViewModel.swift
//  Formula 1
//
//  Created by Olya B on 05.06.2024.
//

import SwiftUI

// MARK: - RaceViewModel Protocol

protocol RaceViewModel: ObservableObject { }

extension RaceViewModel { }

// MARK: - RaceViewModel implementation

final class IRaceViewModel: RaceViewModel {
    
    @ReferenceCounted private var coordinator: UnownedRouter<RaceViewDestination>
    
    
    // MARK: Private properties
    
    
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<RaceViewDestination>) {
        self.coordinator = coordinator
    }
    
    
}
