//
//  SharedStore.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

/// A specific structure designed to store generic object in singleton manner.
struct SharedStore {
    static private var store = [String: AnyObject]()
    
    static func get<T: AnyObject>(_ key: String) -> T {
        if let instance = store[key] as? T {
            return instance
        } else {
            preconditionFailure("---> Instance of \(T.self) was never stored.")
        }
    }
    
    static func add<T: AnyObject>(_ instance: T, forKey key: String) {
        store[key] = instance
    }
    
    private init() {}
}
