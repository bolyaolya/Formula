//
//  RaceViewAssembler.swift
//  Formula 1
//
//  Created by Olya B on 11.06.2024.
//

import UIKit
import SwiftUI

final class RaceViewAssembler {    
    func viewController(coordinator: UnownedRouter<RaceViewDestination>) -> UIViewController {
        let viewModel = IRaceViewModel(coordinator: coordinator)
        let view = RaceView(viewModel: viewModel)
        let hostingController = CustomHostingController(rootView: view)
        hostingController.shouldHideNavBar(true)
        
        return hostingController
    }
}
