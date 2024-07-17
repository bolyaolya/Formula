//
//  LocalizationHelper.swift
//  Formula 1
//
//  Created by Olya Boyko on 17.07.2024.
//

import Foundation

class LocalizationHelper {
    
    /// Returns a localized string for a given key and count, applying Russian pluralization rules.
        ///
        /// - Parameters:
        ///   - key: The base key for the localized string.
        ///   - count: The count to determine pluralization form.
        /// - Returns: The localized string corresponding to the count.
    func localizedStringForKey(_ key: String, count: Int) -> String {
        var formattedKey = "\(key)_\(count)"
        
        let endsWithOne = count % 10 == 1 && count != 11
        
        let group = count % 10
        
        if group >= 2 && group <= 4 {
            formattedKey = "\(key)_\(group)"
        }
        else if endsWithOne {
            formattedKey = "\(key)_1"
        }
        else if count >= 5 {
            formattedKey = "\(key)_many"
        }
        
        return NSLocalizedString(formattedKey, comment: "")
    }
}
