//
//  ReferenceCounterListening.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

public protocol ReferenceCounterListening: AnyObject {
    
    /// Is called in a `delegate`-manner when references count reaches zero.
    func onCountDidReachZero()
}
