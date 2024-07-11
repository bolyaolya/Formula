//
//  ViewControlling.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

// MARK: - ViewControlling

public protocol ViewControlling {
    associatedtype RootViewController: UIViewController
    var rootViewController: RootViewController { get }
}

// MARK: - AnyCoordinating

public typealias AnyCoordinator = Coordinating & ViewControlling
