//
//  Constructors.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

public struct Constructors: Codable {
    public let data: ConstructorsData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct ConstructorsData: Codable {
    public let xmlns: String
    public let series: String
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let constructorTable: ConstructorTable

    private enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case constructorTable = "ConstructorTable"
    }
}

public struct ConstructorTable: Codable {
    public let season: String?
    public let constructors: [Constructor]

    private enum CodingKeys: String, CodingKey {
        case season
        case constructors = "Constructors"
    }
}

public struct Constructor: Codable {
    public let constructorID: String
    public let url: String
    public let name: String
    public let nationality: String

    private enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}
