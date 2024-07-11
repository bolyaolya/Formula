//
//  ModuleDependencyContainer.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

public final class ModuleDependencyContainer {
    
    private var dependencies: [String: AnyObject] = [:]
    
    public func register<T: AnyObject>(_ initializer: @autoclosure @escaping () -> T) {
        let id = String(describing: T.self)
        dependencies[id] = initializer()
    }
    
    public func resolve<T: AnyObject>(_ type: T.Type) throws -> T {
        let id = String(describing: T.self)
        if let dependency = dependencies[id] as? T {
            return dependency
        } else {
            throw ModuleDependencyContainerError.dependencyUnregistered
        }
    }
    
    public func resolve<T: AnyObject>(withProvidedInitializer initializer: @autoclosure @escaping () -> T) -> T {
        let id = String(describing: T.self)
        if let dependency = dependencies[id] as? T {
            return dependency
        } else {
            let newDependency = initializer()
            dependencies[id] = newDependency
            return newDependency
        }
    }
}

public enum ModuleDependencyContainerError: Error {
    case dependencyUnregistered
}

extension ModuleDependencyContainerError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .dependencyUnregistered: ">>>>> Trying to resolve previously unregistered dependency."
        }
    }
}
