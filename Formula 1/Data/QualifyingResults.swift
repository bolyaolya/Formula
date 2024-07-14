//
//  QualifyingResults.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

public struct QualifyingResults: Codable {
    public let data: QualifyingResultsData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct QualifyingResultsData: Codable {
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

public struct QualifyingResult: Codable {
    public let number: String
    public let position: String
    public let driver: Driver
    public let constructor: Constructor
    public let q1: String
    public let q2: String?
    public let q3: String?

    private enum CodingKeys: String, CodingKey {
        case number, position
        case driver = "Driver"
        case constructor = "Constructor"
        case q1 = "Q1"
        case q2 = "Q2"
        case q3 = "Q3"
    }
}
