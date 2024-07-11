//
//  ReferenceCounting.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

public protocol ReferenceCounting: ReferenceCounterListening {
    
    /// A special object that's responsibility is to store references to it (useful
    /// to store references of it's owner) and to handle changes in references
    /// amount.
    var referenceCounter: ReferenceCounter { get }
}
