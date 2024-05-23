//
//  Entities.swift
//  Formula 1
//
//  Created by Olya B on 17.05.2024.
//

import UIKit

struct Race: Codable {
    let id: Int
    let season: Int
    let round: Int
    let circuitId: Int
    let name: String
    let date: String
    
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? Int,
              let season = dictionary["season"] as? Int,
              let round = dictionary["round"] as? Int,
              let circuitId = dictionary["circuitId"] as? Int,
              let name = dictionary["name"] as? String,
              let date = dictionary["date"] as? String else {
            return nil
        }
        
        self.id = id
        self.season = season
        self.round = round
        self.circuitId = circuitId
        self.name = name
        self.date = date
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey:.id)
        season = try container.decode(Int.self, forKey:.season)
        round = try container.decode(Int.self, forKey:.round)
        circuitId = try container.decode(Int.self, forKey:.circuitId)
        name = try container.decode(String.self, forKey:.name)
        date = try container.decode(String.self, forKey:.date)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, season, round, circuitId, name, date
    }
}
