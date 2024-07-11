//
//  Destination.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

/// This protocol has no requirements althogh it is encouraged to be implemented
/// by an enum, that contains all possible destinatinos for navigation from
///  NavigationCoordinator.
public protocol Destination {
    static var initial: Self { get }
}
