//
//  UINavigationController+Proxying.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

extension UINavigationController: ProxyingViewController {
    
    public func switchCurrent(to newViewController: UIViewController, withOptions options: UIView.AnimationOptions?) {
        var proxiedViewControllers: [UIViewController]
        if let childNavigationController = newViewController as? UINavigationController {
            proxiedViewControllers = childNavigationController.viewControllers
        } else {
            proxiedViewControllers = [newViewController]
        }
        UIView.transition(with: view, duration: 0.3, options: options ?? []) {
            self.setViewControllers(proxiedViewControllers, animated: (options == nil))
        }
    }
}
