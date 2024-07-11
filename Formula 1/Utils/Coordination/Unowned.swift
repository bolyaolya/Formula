//
//  Unowned.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

public final class Unowned<Value> {
    
    private var _value: () -> Value
    
    public var wrappedValue: Value {
        _value()
    }
    
    public init<Erasable: AnyObject>(_ value: Erasable, erase: @escaping (Erasable) -> Value) {
        self._value = Unowned.createValueClosure(for: value, erase: erase)
    }
    
    private static func createValueClosure<Erasable: AnyObject>(for value: Erasable,
                                                                erase: @escaping (Erasable) -> Value) -> () -> Value {
        { [unowned value] in erase(value) }
    }
}
