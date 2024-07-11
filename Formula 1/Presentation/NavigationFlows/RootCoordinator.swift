//
//  RootCoordinator.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

final class RootCoordinator: TabsCoordinator {
    
    override func prepareToStart(with preconditionData: [String : Any]) {
        do {
//            guard let playerUserProfile = preconditionData[PlayerRootPreconditionDataKey.playerUserProfile.rawValue] as? UserProfile else {
//                throw PlayerRootCoordinatorError.noUserProfileWasPassed
//            }
//            guard let player = try DataConverter().convert(playerUserProfile) as? Player else {
//                throw PlayerRootCoordinatorError.failedToDecodeUserProfile
//            }
//            let stateKeeper = PlayerStateKeeper(player: player)
//            GlobalDependencyContainer.register(type: PlayerStateKeeper.self, stateKeeper)
//            
//            let playerRepository = UserRepository(playerUserProfile)
//            GlobalDependencyContainer.register(type: UserRepository.self, playerRepository)
        } catch {
            preconditionFailure("---> \(#function): \(error)")
            // TODO: Здесь обработать ошибку!! Возможно сделать, чтобы презентовался алерт.
        }
    }
    
    override func start() {
        rootViewController.tabBar.tintColor = .white
        let mainCoordinator = RaceViewCoordinator()
//        let podiumCoordinator = PlayerCollectionsCoordinator()
//        let profileCoordinator = PlayerProfileCoordinator()
        setupTabBarAppearance()
        setCoordinatedTabs([mainCoordinator])
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
