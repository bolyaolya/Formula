//
//  Coordinator.swift
//  Formula 1
//
//  Created by Olya B on 07.05.2024.
//

import UIKit

// MARK: - Coordinator

protocol Coordinator: AnyObject {
    var parentCoordinator: (Coordinator)? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
    func stop()
    
    func addChild(_ childCoordinator: Coordinator)
    func removeChild(_ childCoordinator: Coordinator)
    
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}

extension Coordinator {
    
    var currentViewController: UIViewController? {
        return navigationController.topViewController
    }
    
    func stop() {
        parentCoordinator?.removeChild(self)
    }
    
    func addChild(_ childCoordinator: any Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChild(_ childCoordinator: Coordinator) {
        childCoordinators.removeAll { $0 === childCoordinator }
    }
    
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        navigationController.present(viewControllerToPresent, animated: true, completion: completion)
    }
    
    func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: flag, completion: completion)
    }
}

