//
//  TimeZoneInfo.swift
//  Formula 1
//
//  Created by Olya Boyko on 17.07.2024.
//

import Foundation

struct TimeZoneInfo: Codable {
    let sunrise: String
    let lng: Double
    let countryCode: String
    let gmtOffset: Int
    let rawOffset: Int
    let sunset: String
    let timezoneId: String
    let dstOffset: Int
    let countryName: String
    let time: String
    let lat: Double
}
