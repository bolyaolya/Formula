//
//  Drivers.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

public struct Drivers: Codable {
    public let data: DriversData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct DriversData: Codable {
    public let series: String
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let driverTable: DriverTable

    private enum CodingKeys: String, CodingKey {
        case series, url, limit, offset, total
        case driverTable = "DriverTable"
    }
}

public struct DriverTable: Codable {
    public let season: String?
    public let drivers: [Driver]

    private enum CodingKeys: String, CodingKey {
        case season
        case drivers = "Drivers"
    }
}
