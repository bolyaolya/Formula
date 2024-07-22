//
//  CalendarAssembler.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import UIKit
import SwiftUI

final class CalendarAssembler {
    
    func viewController(coordinator: UnownedRouter<CalendarDestination>) -> UIViewController {
        let viewModel = ICalendarViewModel(coordinator: coordinator)
        let view = CalendarView(viewModel: viewModel)
        let hostingController = CustomHostingController(rootView: view)
        hostingController.shouldHideNavBar(true)
        
        return hostingController
    }
}
