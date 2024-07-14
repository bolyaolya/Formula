//
//  DependencyWrapper.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

@propertyWrapper
struct Dependency<T> {
    var dependency: T
    
    init() {
        guard let dependency = GlobalDependencyContainer.resolve(T.self) else {
            fatalError("Dependency \(T.self) was attemted to resolve but was never registered")
        }
        self.dependency = dependency
    }
    
    var wrappedValue: T {
        get { dependency }
        set { dependency = newValue }
    }
}
