//
//  FCustomHostingController.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import SwiftUI

final class FCustomHostingController<Content>: UIHostingController<Content> where Content: View {
    
    private var shouldHideNavBar: Bool = false
    private var shouldHideNavBarAnimated: Bool = false
    private var shouldHideTabBar: Bool = false
    
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
