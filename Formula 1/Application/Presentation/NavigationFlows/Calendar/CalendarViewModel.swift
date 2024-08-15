//
//  CalendarViewModel.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import SwiftUI

// MARK: - CalendarViewModel Protocol

protocol CalendarViewModel: ObservableObject {
    var round: String { get }
    var countryName: String { get }
    var trackName: String { get }
    var trackScheme: UIImage { get }
    
    var isLoading: Bool { get }
}

extension CalendarViewModel { }

// MARK: - CalendarViewModel implementation

final class ICalendarViewModel: CalendarViewModel {
    @ReferenceCounted private var coordinator: UnownedRouter<CalendarDestination>
    
    @Published var round: String = ""
    @Published var countryName: String = ""
    @Published var trackName: String = ""
    @Published var trackScheme: UIImage = UIImage()
    
    @Published var isLoading: Bool = false
    
    // MARK: Private properties
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<CalendarDestination>) {
        self.coordinator = coordinator
    }
    
    // MARK: Methods
}
