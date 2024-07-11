//
//  UpcomingRace.swift
//  Formula 1
//
//  Created by Olya B on 17.05.2024.
//

import Foundation

struct UpcomingRace: Codable {
    let session_key: Int
    let session_name: String
    let session_type: String
    let year: Int
    let date_start: String
    let date_end: String
    let location: String
    let country_name: String
    let meeting_key: Int
    
    enum CodingKeys: String, CodingKey {
        case session_key, session_name, session_type, year, date_start, date_end, location, country_name, meeting_key
    }
}
