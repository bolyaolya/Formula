//
//  DetachedContext.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

open class DetachedContext<ReasonType: Reason> {
   
    public var reason: ReasonType
    
    public init(reason: ReasonType) {
        self.reason = reason
    }
    
    open func performDetachedTransition() {
        return
    }
}
