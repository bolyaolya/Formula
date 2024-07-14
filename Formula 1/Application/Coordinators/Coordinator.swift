//
//  Coordinator.swift
//  Formula 1
//
//  Created by Olya B on 07.05.2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func pushViewController(_ viewController: UIViewController)
    func presentViewController(_ viewController: UIViewController)
    func showAlert(title: String, message: String)
    func dismiss()
    func popViewController()
    func start()
}

extension Coordinator {
    func pushViewController(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentViewController(_ viewController: UIViewController) {
        let presentedNavigationController = UINavigationController(rootViewController: viewController)
        navigationController.present(presentedNavigationController, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(.init(title: "OK", style: .default))
        navigationController.present(alert, animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
    
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
}
