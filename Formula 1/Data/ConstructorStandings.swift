//
//  ConstructorStandings.swift
//  Formula
//
//  Created by Olya Boyko on 27.08.2024.
//

import Foundation

public struct ConstructorStandings: Codable {
    public let data: ConstructorStandingsData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct ConstructorStandingsData: Codable {
    public let series: String
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let standingsTable: StandingTable

    private enum CodingKeys: String, CodingKey {
        case series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }
}

public struct StandingTable: Codable {
    public let season: String?
    public let standingsLists: [StandingsLists]

    private enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

public struct StandingsLists: Codable {
    public let season, round: String
    public let constructorStandings: [ConstructorStanding]

    private enum CodingKeys: String, CodingKey {
        case season, round
        case constructorStandings = "ConstructorStandings"
    }
}

public struct ConstructorStanding: Codable, Identifiable {
    public let position: String
    public let positionText: String
    public let points: String
    public let wins: String
    public let constructor: Constructor
    
    public var id: String {
        constructor.constructorID
    }
    
    private enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
    }
}
