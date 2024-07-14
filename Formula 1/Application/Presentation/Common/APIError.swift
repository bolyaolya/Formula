//
//  APIError.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

public enum APIError: Error {
    case url(String)
    case network(String)
    case parsing(String)
    case data(String)
}
