//
//  PitStops.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

public struct PitStops: Codable {
    public let data: PitStopsData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct PitStopsData: Codable {
    public let series: String
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let raceTable: RaceTable

    private enum CodingKeys: String, CodingKey {
        case series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

public struct PitStop: Codable {
    public let driverID: String
    public let lap: String
    public let stop: String
    public let time: String
    public let duration: String

    private enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case lap, stop, time, duration
    }
}
