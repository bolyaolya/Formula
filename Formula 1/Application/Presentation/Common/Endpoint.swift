//
//  Endpoint.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

/// Internal struct for query items used in URLs.
private enum QueryItems {
    /// Limit indicator, to specify to the API how many items to return at a time per request.
    case limit(String?)
    
    /// Offset indicator, to specify to the API the starting point of elements.
    case offset(String?)
}

/// Indicates URL components for the REST API.
private enum JolpiEndpoint {
    /// URL scheme.
    static let scheme = "http"
    
    /// URL host.
    static let host = "api.jolpi.ca"
}

/// Generates a URL for a given Path enum case.
internal struct Endpoint {
    /// URL for API.
    private let urlPath: String
    
    /// Indicates number of items to return per request.
    private var limit: String?
    
    /// Indicates the starting point of elements from API request.
    private var offset: String?
    
    /// Initializer for an Endpoint object.
    /// - Parameters:
    ///   - path: Specify a path, mapping to a specific endpoint of the REST API.
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.  All historical seasons will be fetched if nil.
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    init(with path: Path, for season: Season?, round: String?, lap: String?, limit: String?, offset: String?) {
        urlPath = path.urlPath(for: season, round: round, lap: lap)
        
        self.limit = limit
        self.offset = offset
    }
}

// MARK: - Endpoint URL Builder
extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = JolpiEndpoint.scheme
        components.host = JolpiEndpoint.host
        components.path = urlPath
        
        var queryItems: [URLQueryItem] = .init()
        
        if let limit = limit {
            let item = URLQueryItem(name: "limit", value: limit)
            queryItems.append(item)
        }
        
        if let offset = offset {
            let item = URLQueryItem(name: "offset", value: offset)
            queryItems.append(item)
        }
        
        components.queryItems = queryItems
        
        guard let validURL = components.url else { fatalError("Could not construct URL.") }
        
        return validURL
    }
}
