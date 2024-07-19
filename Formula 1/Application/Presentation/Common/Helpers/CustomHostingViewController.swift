//
//  CustomHostingViewController.swift
//  Formula 1
//
//  Created by Olya Boyko on 18.07.2024.
//

import SwiftUI

final class CustomHostingController<Content>: UIHostingController<Content> where Content: View {
    
    private var shouldHideNavBar: Bool = false
    private var shouldHideNavBarAnimated: Bool = false
    private var shouldHideTabBar: Bool = false
    
    private var dimmingViewController: DimmingViewControllerProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(shouldHideNavBar, animated: shouldHideNavBarAnimated)
        tabBarController?.tabBar.isHidden = shouldHideTabBar
    }
    
    func shouldHideNavBar(_ flag: Bool, animated: Bool = false) {
        self.shouldHideNavBar = flag
        self.shouldHideNavBarAnimated = animated
    }
    
    func shouldHideTabBar(_ flag: Bool) {
        self.shouldHideTabBar = flag
    }
}

extension CustomHostingController: DimmingProxy {
    
    func shouldDimCurrentScreen(_ flag: Bool, onDimHide: @escaping () -> Void) {
        if flag {
            dimmingViewController = makeLoadingDimmingViewController()
            dimmingViewController?.present(on: self)
        } else {
            dimmingViewController?.hide {
                onDimHide()
            }
            dimmingViewController = nil
        }
    }
    
    private func makeLoadingDimmingViewController() -> DimmingViewControllerProtocol {
        return LoadingDimmingViewController()
    }
}
