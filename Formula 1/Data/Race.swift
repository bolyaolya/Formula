//
//  Race.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

public struct RaceSchedule: Codable {
    public let data: RaceScheduleData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct RaceScheduleData: Codable {
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

public struct RaceTable: Codable {
    public let season: String
    public let round: String?
    public let races: [Race]

    private enum CodingKeys: String, CodingKey {
        case season, round
        case races = "Races"
    }
}

public struct Race: Codable {
    public let season: String
    public let round: String
    public let url: String
    public let raceName: String
    public let circuit: Circuit
    public let date: String
    public let time: String
    public let firstPractice: FirstPractice?
    public let secondPractice: SecondPractice?
    public let thirdPractice: ThirdPractice?
    public let qualifyingResults: [QualifyingResult]?
    public let pitStops: [PitStop]?
    public let laps: [LapElement]?


    private enum CodingKeys: String, CodingKey {
        case season, round, url, raceName, date, time
        case circuit = "Circuit"
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifyingResults = "QualifyingResults"
        case pitStops = "PitStops"
        case laps = "Laps"
    }
}

public struct FirstPractice: Codable {
    public let date: String
    public let time: String
    
    public enum CodingKeys: String, CodingKey {
        case date, time
    }
} 

public struct SecondPractice: Codable {
    public let date: String
    public let time: String
    
    public enum CodingKeys: String, CodingKey {
        case date, time
    }
} 

public struct ThirdPractice: Codable {
    public let date: String
    public let time: String
    
    public enum CodingKeys: String, CodingKey {
        case date, time
    }
}
