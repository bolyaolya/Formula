//
//  CalendarViewModel.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import SwiftUI

// MARK: - CalendarViewModel Protocol

protocol CalendarViewModel: ObservableObject {
    
    var isLoading: Bool { get }
}

extension CalendarViewModel { }

// MARK: - CalendarViewModel implementation

final class ICalendarViewModel: CalendarViewModel {
    
    @ReferenceCounted private var coordinator: UnownedRouter<CalendarDestination>
    
    @Published var isLoading: Bool = false
    
    // MARK: Private properties
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<CalendarDestination>) {
        self.coordinator = coordinator
    }
    
    //MARK: Methods
    
    
}
