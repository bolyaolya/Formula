//
//  ReferenceOperatable.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

public protocol ReferenceOperatable: AnyObject {
    
    /// Unary operator provided as a conviniet way to increment count of references.
    static postfix func ++ (_ rc: Self)
    
    /// Unary operator provided as a conviniet way to decrement count of references.
    static postfix func -- (_ rc: Self)
    
}
