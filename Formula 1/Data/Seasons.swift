//
//  Season.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

public struct Seasons: Codable {
    public let data: SeasonData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct SeasonData: Codable {
    public let series: String
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let seasonTable: SeasonTable

    private enum CodingKeys: String, CodingKey {
        case series, url, limit, offset, total
        case seasonTable = "SeasonTable"
    }
}

public struct SeasonTable: Codable {
    public let seasons: [F1Season]

    private enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
    }
}

public struct F1Season: Codable {
    public let season: String
    public let url: String
}
