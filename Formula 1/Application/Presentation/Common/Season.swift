//
//  Season.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

// MARK: - Season
/// Season enum to indicate whether a networking function is to fetch all historical data, or data for a single season.
public enum Season {
    /// A year, representing a specific season.
    case year(Int)
    /// All historical data endpoint).
    case all
    
    static var currentYear: Season {
        let currentYear = Calendar.current.component(.year, from: Date())
        return .year(currentYear)
    }
}

extension Season {
    /// Function to be used by the Path endpoint builder.
    /// - Returns: String that will be part of the resultant URL.
    var query: String? {
        switch self {
            case .year(let year):
            return "/\(year)"
        case .all:
            return ""
        }
    }
}
