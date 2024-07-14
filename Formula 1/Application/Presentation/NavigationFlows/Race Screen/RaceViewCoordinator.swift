//
//  RaceViewCoordinator.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

enum RaceViewDestination: Destination {
    case initial
}

final class RaceViewCoordinator: NavigationCoordinator<RaceViewDestination> {
    
    override func prepareToStart() {
        setupNavBarAppearance()
        setupTabBarItem()
    }
    
    override func prepareNavigationTransition(for destination: RaceViewDestination) -> NavigationTransition {
        switch destination {
        case .initial:
            let raceViewController = RaceViewAssembler().viewController(coordinator: unownedRouter)
            return .setSingleViewController(raceViewController)
        }
    }
    
    private func setupNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .greyColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.configureWithTransparentBackground()
        
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
        let raceTabBarItem = UITabBarItem(title: "Гонка", image: .carImage, selectedImage: .carBoldImage)
        raceTabBarItem.tag = 0
        rootViewController.tabBarItem = raceTabBarItem
    }
}


