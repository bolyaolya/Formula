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
//        setupNavBarAppearance()
        setupTabBarAppearance()
        
        let tabBarController = makeRootTabBar()
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
//    private func setupNavBarAppearance() {
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.backgroundColor = .darkColor
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        
//        navigationController.navigationBar.standardAppearance = navBarAppearance
//        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
//        
//        navigationController.navigationBar.isHidden = true
//    }
    
    private func setupTabBarAppearance() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = .tabBar
        tabBarAppearance.tintColor = .lightColor
        tabBarAppearance.barTintColor = .lightGray
    }
    
    private func makeRootTabBar() -> UITabBarController {
        let raceVC = RaceViewController()
        let podiumVC = PodiumViewController()
        
        let raceTabBarItem = UITabBarItem(title: "Гонка", image: .carImage, tag: 0)
        let podiumTabBarItem = UITabBarItem(title: "Чемпионат", image: .podiumImage, tag: 1)
//        let calendarTabBarItem = UITabBarItem(title: "Календарь", image: .circleImage, tag: 2)
        
        let raceSelectedTab = UIImage.carBoldImage.withRenderingMode(.alwaysOriginal)
        let podiumSelectedTab = UIImage.podiumBoldImage.withRenderingMode(.alwaysOriginal)
        
        raceVC.tabBarItem = raceTabBarItem
        podiumVC.tabBarItem = podiumTabBarItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [raceVC, podiumVC]
        
        if let tabBarItems = tabBarController.tabBar.items {
            tabBarItems[0].selectedImage = raceSelectedTab
            tabBarItems[1].selectedImage = podiumSelectedTab
        }
        
        return tabBarController
    }
}
