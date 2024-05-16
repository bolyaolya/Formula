//
//  UIColor.swift
//  Formula 1
//
//  Created by Olya B on 16.05.2024.
//

import UIKit

extension UIColor {
    class var darkColor: UIColor {
        UIColor(named: "darkColor") ?? black
    }
    
    class var tabBarColor: UIColor {
        UIColor(named: "tabBarColor") ?? black
    }
    
    class var darkRedColor: UIColor {
        UIColor(named: "darkRedColor") ?? red
    }
    
    class var greyColor: UIColor {
        UIColor(named: "greyColor") ?? grey
    }
    
    class var lightColor: UIColor {
        UIColor(named: "lightColor") ?? lightGray
    }
    
    class var lightRedColor: UIColor {
        UIColor(named: "lightRedColor") ?? lightRed
    }
}
