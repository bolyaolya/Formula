//
//  NavigationType.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

public enum NavigationType {
    case modal(presentationStyle: UIModalPresentationStyle, completion: (() -> Void)?)
    case pushing
    case setting
    case none
}
