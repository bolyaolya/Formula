//
//  SettingsAssembler.swift
//  Formula
//
//  Created by Olya Boyko on 22.08.2024.
//

import UIKit
import SwiftUI

final class SettingsAssembler {
    func viewController(coordinator: UnownedRouter<SettingsDestination>) -> UIViewController {
        let viewModel = ISettingsViewModel(coordinator: coordinator)
        let view = SettingsView(viewModel: viewModel)
        let hostingController = CustomHostingController(rootView: view)
        hostingController.shouldHideNavBar(true)
        
        return hostingController
    }
}
