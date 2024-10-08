//
//  Circuits.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

public struct Circuits: Codable {
    public let data: CircuitData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public extension Circuits {
    var currentCircuits: [Circuit] { self.data.circuitTable.circuits }
}

public struct CircuitData: Codable {
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let circuitTable: CircuitTable

    private enum CodingKeys: String, CodingKey {
        case url, limit, offset, total
        case circuitTable = "CircuitTable"
    }
}

public struct CircuitTable: Codable {
    public let season: String?
    public let circuits: [Circuit]

    private enum CodingKeys: String, CodingKey {
        case circuits = "Circuits"
        case season
    }
}

public struct Circuit: Codable {
    public let circuitID: String
    public let circuitName: String
    public let location: Location

    private enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case circuitName
        case location = "Location"
    }
}

public struct Location: Codable {
    public let lat: String
    public let long: String
    public let locality: String
    public let country: String
}
