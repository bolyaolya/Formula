//
//  ChampionshipCoordinator.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

enum ChampionshipDestination: Destination {
    case initial
}

final class ChampionshipCoordinator: NavigationCoordinator<ChampionshipDestination> {
    override func prepareToStart() {
        setupNavBarAppearance()
        setupTabBarItem()
    }
    
    override func prepareNavigationTransition(for destination: ChampionshipDestination) -> NavigationTransition {
        switch destination {
        case .initial:
            let championshipViewController = ChampionshipAssembler().viewController(coordinator: unownedRouter)
            return .setSingleViewController(championshipViewController)
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
        let podiumImage = UIImage(named: "podiumImage")?.resize(targetSize: CGSize(width: 30, height: 30))
        let podiumBoldImage = UIImage(named: "podiumBoldImage")?.resize(targetSize: CGSize(width: 30, height: 30))
        
        let champTabBarItem = UITabBarItem(title: "Чемпионат", image: podiumImage, selectedImage: podiumBoldImage)
        champTabBarItem.tag = 1
        rootViewController.tabBarItem = champTabBarItem
    }
}
