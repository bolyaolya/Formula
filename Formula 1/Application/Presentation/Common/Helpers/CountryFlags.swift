//
//  CountryFlags.swift
//  Formula 1
//
//  Created by Olya Boyko on 16.07.2024.
//

import UIKit

class CountryFlags {
    static func countryFlagsImages(for countryName: String) -> UIImage {
        switch countryName {
        case "Bahrain":
            return UIImage(named: "Bahrain") ?? UIImage()
        case "Saudi Arabia":
            return UIImage(named: "Saudi_Arabia") ?? UIImage()
        case "Australia":
            return UIImage(named: "Australia") ?? UIImage()
        case "Japan":
            return UIImage(named: "Japan") ?? UIImage()
        case "China":
            return UIImage(named: "China") ?? UIImage()
        case "USA":
            return UIImage(named: "USA") ?? UIImage()
        case "Monaco":
            return UIImage(named: "Monaco") ?? UIImage()
        case "Canada":
            return UIImage(named: "Canada") ?? UIImage()
        case "Spain":
            return UIImage(named: "Spain") ?? UIImage()
        case "Austria":
            return UIImage(named: "Austria") ?? UIImage()
        case "UK":
            return UIImage(named: "Great_Britain") ?? UIImage()
        case "Hungary":
            return UIImage(named: "Hungary") ?? UIImage()
        case "Belgium":
            return UIImage(named: "Belgium") ?? UIImage()
        case "Netherlands":
            return UIImage(named: "Netherlands") ?? UIImage()
        case "Italy":
            return UIImage(named: "Italy") ?? UIImage()
        case "Azerbaijan":
            return UIImage(named: "Azerbaijan") ?? UIImage()
        case "Singapore":
            return UIImage(named: "Singapore") ?? UIImage()
        case "Mexico":
            return UIImage(named: "Mexico") ?? UIImage()
        case "Brazil":
            return UIImage(named: "Brazil") ?? UIImage()
        case "United States":
            return UIImage(named: "USA") ?? UIImage()
        case "Qatar":
            return UIImage(named: "Qatar") ?? UIImage()
        case "UAE":
            return UIImage(named: "United_Arab_Emirates") ?? UIImage()
        default:
            return UIImage()
        }
    }
}
