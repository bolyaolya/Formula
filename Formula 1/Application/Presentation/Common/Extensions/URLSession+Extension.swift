//
//  URLSession+Extension.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

extension URLSession {
    private func dataTask(_ url: URL, _ session: URLSession, completion: @escaping ((Result<Data, APIError>) -> Void)) {
        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(.network(error.localizedDescription)))
                } else {
                    completion(.failure(.data("Failed to generate data.")))
                }
                return
            }
            completion(.success(data))
        }
        .resume()
    }
    
    internal func fetch<T: Decodable>(
        _ subPath: Path,
        for season: Season? = nil,
        round: String? = nil,
        lap: String? = nil,
        limit: String? = nil,
        offset: String? = nil,
        session: URLSession = URLSession.shared,
        completion: @escaping ((Result<T, APIError>) -> Void)
    ) {
        let endpoint = Endpoint(with: subPath, for: season, round: round, lap: lap, limit: limit, offset: offset)
        let url = endpoint.url

        session.dataTask(url, session) { result in
            switch result {
            case .success(let data):
                do {
                    let decode = try subPath.decodingType.decode(from: data)
                    completion(.success(decode as! T))
                } catch (let error) {
                    print("Decoding error: \(error.localizedDescription)")
                    completion(.failure(.network(error.localizedDescription)))
                }
            case .failure(let error):
                print("Network error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }

    /// Async/await networking fetch function.
    ///
    /// Calls the data task function and decodes the JSON response.
    ///
    /// - Parameters:
    ///   - subPath: Path enum case to indicate which endpoint you wish to fetch from.
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020). Fetches data for all historical seasons of given endpoint if nil.
    ///   - round: A race within the season.
    ///   - lap: Lap of given race.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    ///   - session: URLSession instance (URLSession.shared singleton by default)
    /// - Returns: A model representing the decodable model that is specified by the `subPath` parameter.
    internal func fetch<T: Decodable>(
        _ subPath: Path,
        for season: Season? = nil,
        round: String? = nil,
        lap: String? = nil,
        limit: String? = nil, 
        offset: String? = nil,
        session: URLSession = URLSession.shared
    ) async throws -> T {
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            self?.fetch(subPath, for: season, round: round, lap: lap, limit: limit, offset: offset, session: session) { result in
                continuation.resume(with: result)
            }
        }
    }
}
