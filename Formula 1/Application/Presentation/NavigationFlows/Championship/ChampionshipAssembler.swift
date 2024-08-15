//
//  ChampionshipAssembler.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit
import SwiftUI

final class ChampionshipAssembler {    
    func viewController(coordinator: UnownedRouter<ChampionshipDestination>) -> UIViewController {
        let viewModel = IChampionshipViewModel(coordinator: coordinator)
        let view = ChampionshipView(viewModel: viewModel)
        let hostingController = CustomHostingController(rootView: view)
        hostingController.shouldHideNavBar(true)
        
        return hostingController
    }
}
