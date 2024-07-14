//
//  Decodable+Extension.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

extension Decodable {
    static func decode(from: Data, using decoder: JSONDecoder = JSONDecoder()) throws -> Self {
        return try decoder.decode(self, from: from)
    }
}
