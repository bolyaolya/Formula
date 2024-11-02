//
//  RootCoordinator.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

final class RootCoordinator: TabsCoordinator {
    override func prepareToStart(with preconditionData: [String: Any]) {
        // TODO: добавить подгрузку профиля пользователя
    }
    
    override func start() {
        rootViewController.tabBar.tintColor = .white
        let mainCoordinator = RaceViewCoordinator()
        let championshipCoordinator = ChampionshipCoordinator()
        let calendarCoordinator = CalendarCoordinator()
        let settingsCoordinator = SettingsCoordinator()
        setupTabBarAppearance()
        setCoordinatedTabs([mainCoordinator, championshipCoordinator, calendarCoordinator])
    }
    
    private func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .tabBarColor

        rootViewController.tabBar.standardAppearance = tabBarAppearance
        rootViewController.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        rootViewController.tabBar.tintColor = .white
        rootViewController.tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.4)
    }
}

enum RootCoordinatorError: Error {
    case noUserProfileWasPassed
    case failedToDecodeUserProfile
}

extension RootCoordinatorError: CustomStringConvertible {
    var description: String {
        switch self {
        case .failedToDecodeUserProfile:
            "Failed to decode coach from given user profile."
        case .noUserProfileWasPassed:
            "Was waiting for some user profile but none was passed."
        }
    }
}
