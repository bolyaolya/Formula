//
//  DetachedTransitionHandling.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

public protocol DetachedTransitionHandling {

    /// Method handles a specific transition is a specified context that does not belong to any coordinator.
    ///
    /// This may be useful to call AppCoordinator from deeper places in coordination hierarchy without
    /// calling a chain of all the above parent coordinators.
    ///
    /// - Parameter context:
    ///     method takes some detached context in which it is specified how exactly a transition should
    ///     be performed.
    func performDetachedTransition(_ context: DetachedContext<some Reason>)
}

extension DetachedTransitionHandling {
    
    public func performDetachedTransition(_ context: DetachedContext<some Reason>) {
        context.performDetachedTransition()
    }
}
