//
//  SettingsViewModel.swift
//  Formula
//
//  Created by Olya Boyko on 22.08.2024.
//

import SwiftUI
import StoreKit

// MARK: - SettingsViewModel Protocol

protocol SettingsViewModel: ObservableObject {
    func rateApp()
}

// MARK: - CalendarViewModel implementation

final class ISettingsViewModel: SettingsViewModel {
    @ReferenceCounted private var coordinator: UnownedRouter<SettingsDestination>
    
    @Published var isLoading: Bool = false
    
    // MARK: Init
    
    init(coordinator: UnownedRouter<SettingsDestination>) {
        self.coordinator = coordinator
    }
    
    // MARK: Methods
    
    @MainActor
    func rateApp() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            DispatchQueue.main.async {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}
