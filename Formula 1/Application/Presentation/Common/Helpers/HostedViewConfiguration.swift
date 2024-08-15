//
//  HostedViewConfiguration.swift
//  Formula 1
//
//  Created by Olya Boyko on 18.07.2024.
//

import Foundation

// MARK: - HostedViewConfigurable

/// Should be witnessed by an object that should store and access configuration object
protocol HostedViewConfigurable {
    var configuration: HostedViewConfiguring? { get set }
}

// MARK: - HostedViewConfiguring

// Should be witnessed by a configuration class
protocol HostedViewConfiguring {
    var dimmingProxy: DimmingProxy? { get }
}

// MARK: - HostedViewConfiguration

final class HostedViewConfiguration: HostedViewConfiguring {    
    weak var dimmingProxy: DimmingProxy?
    
    init(dimmingProxy: DimmingProxy? = nil) {
        self.dimmingProxy = dimmingProxy
    }
}
