//
//  Router.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

public final class Router<DestinationType: Destination, RootViewController: UINavigationController>: Routing, DetachedTransitionHandling, ReferenceCounting {
    
    // MARK: Public properties
    
    public var rootViewController: UINavigationController
    
    public var referenceCounter: ReferenceCounter
    
    // MARK: Private properties
    
    private var _prepareNavigationTransition: (DestinationType) -> NavigationTransition
    private var _navigateTo: (DestinationType) -> Void
    private var _shouldStop: () -> Void
    
    // MARK: Init
    
    public init<T: Routing>(_ router: T, referenceCounter: ReferenceCounter) where T.DestinationType == DestinationType, T.RootViewController == UINavigationController {
        self.rootViewController = router.rootViewController
        self._navigateTo = router.navigateTo
        self._prepareNavigationTransition = router.prepareNavigationTransition
        self._shouldStop = router.shouldStop
        self.referenceCounter = referenceCounter
        self.referenceCounter.listener = self
    }
    
    // MARK: Public methods
    
    public func navigateTo(_ destination: DestinationType) {
        _navigateTo(destination)
    }
    
    public func prepareNavigationTransition(for destination: DestinationType) -> NavigationTransition {
        _prepareNavigationTransition(destination)
    }
    
    public func shouldStop() {
        _shouldStop()
    }
    
    public func onCountDidReachZero() {
        shouldStop()
    }
}

