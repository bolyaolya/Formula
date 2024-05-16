//
//  AppRootTabBar.swift
//  Formula 1
//
//  Created by Olya B on 16.05.2024.
//

import UIKit

final class AppRootTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarApperance()
        makeRootTabBar()
    }
    
    private func setupTabBarApperance() {
        let tabBarApperance = UITabBarAppearance()
        tabBarApperance.backgroundColor = .tabBarColor

        tabBar.standardAppearance = tabBarApperance
        tabBar.scrollEdgeAppearance = tabBarApperance
        
        tabBar.tintColor = .lightColor
        tabBar.unselectedItemTintColor = .lightColor.withAlphaComponent(0.4)
        
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
