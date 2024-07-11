//
//  FAppCoordinator.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

enum MMRootFlow: RootFlow {
    case authentication
    case mainFlow
}

final class FAppCoordinator: AppCoordinator<MMRootFlow> {
    
    override func prepareCoordinator(for rootFlow: MMRootFlow) -> any AnyCoordinator {
        switch rootFlow {
        case .authentication:
            AuthenticationCoordinator(rootViewController: rootViewController as! UINavigationController)
        case .mainFlow:
            RootCoordinator()
        }
    }
    
    override func appCoordinatorDidStart() {
        setupNavBarAppearance()
        shouldStartCoordinatedRootFlow(.mainFlow, withOptions: [])
    }
    
    // MARK: Private methods
    
    private func setupNavBarAppearance() {
        guard let navigationController = rootViewController as? UINavigationController else { return }
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .lightGray.withAlphaComponent(0.1)
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController.navigationBar.standardAppearance = navBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationController.navigationBar.isHidden = true
    }
}
