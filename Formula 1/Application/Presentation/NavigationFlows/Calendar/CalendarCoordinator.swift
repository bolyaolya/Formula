//
//  CalendarCoordinator.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import UIKit

enum CalendarDestination: Destination {
    case initial
}

final class CalendarCoordinator: NavigationCoordinator<CalendarDestination> {
    override func prepareToStart() {
        setupNavBarAppearance()
        setupTabBarItem()
    }
    
    override func prepareNavigationTransition(for destination: CalendarDestination) -> NavigationTransition {
        switch destination {
        case .initial:
            let calendarViewController = CalendarAssembler().viewController(coordinator: unownedRouter)
            return .setSingleViewController(calendarViewController)
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
        let calendarImage = UIImage(named: "circleImage")?.resize(targetSize: CGSize(width: 30, height: 30))
        let calendarBoldImage = UIImage(named: "circleBoldImage")?.resize(targetSize: CGSize(width: 30, height: 30))
        
        let calendarTabBarItem = UITabBarItem(title: "Календарь", image: calendarImage, selectedImage: calendarBoldImage)
        calendarTabBarItem.tag = 1
        rootViewController.tabBarItem = calendarTabBarItem
    }
}
