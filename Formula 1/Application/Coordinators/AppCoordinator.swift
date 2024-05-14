//
//  AppCoordinator.swift
//  Formula 1
//
//  Created by Olya B on 07.05.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setupNavBarAppearance()
        
        let tabBarController = makeRootTabBar()
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    private func setupNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController.navigationBar.standardAppearance = navBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationController.navigationBar.isHidden = false
    }
    
    private func makeRootTabBar() -> UITabBarController {
        let raceVC = RaceViewController()
        let calendarVC = CalendarViewController()
        
        let raceTabBarItem = UITabBarItem(title: "Race", image: UIImage(named: "race_icon"), tag: 0)
        let calendarTabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar_icon"), tag: 1)
        
        raceVC.tabBarItem = raceTabBarItem
            calendarVC.tabBarItem = calendarTabBarItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [raceVC, calendarVC]
        
        return tabBarController
    }
}
