//
//  SettingsCoordinator.swift
//  Formula
//
//  Created by Olya Boyko on 22.08.2024.
//

import UIKit

enum SettingsDestination: Destination {
    case initial
}

final class SettingsCoordinator: NavigationCoordinator<SettingsDestination> {
    override func prepareToStart() {
        setupNavBarAppearance()
        setupTabBarItem()
    }
    
    override func prepareNavigationTransition(for destination: SettingsDestination) -> NavigationTransition {
        switch destination {
        case .initial:
            let settingsViewController = SettingsAssembler().viewController(coordinator: unownedRouter)
            return .setSingleViewController(settingsViewController)
        }
    }
    
    private func setupNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .greyColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backButtonAppearance = backButtonAppearance
        
        let backButton = UIBarButtonItem()
        backButton.title = nil
        rootViewController.navigationItem.backBarButtonItem = backButton
        
        rootViewController.navigationBar.standardAppearance = navBarAppearance
        rootViewController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        rootViewController.navigationBar.isHidden = true
    }
    
    private func setupTabBarItem() {
        let settingsImage = UIImage(systemName: "gearshape")?
            .resize(targetSize: CGSize(width: 30, height: 30))
        let settingsBoldImage = UIImage(systemName: "gearshape.fill")?
            .resize(targetSize: CGSize(width: 30, height: 30))
        
        let calendarTabBarItem = UITabBarItem(title: "Настройки", image: settingsImage,
                                              selectedImage: settingsBoldImage)
        calendarTabBarItem.tag = 3
        rootViewController.tabBarItem = calendarTabBarItem
    }
}
