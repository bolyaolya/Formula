//
//  NetworkManager.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import Foundation

public class NetworkManager {    
    /// Asynchronously fetches Formula 1 Circuits for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    /// - Returns: A model representing Circuits
    func circuits(for season: Season, limit: String? = nil, offset: String? = nil) async throws -> Circuits {
        try await URLSession.shared.fetch(.circuits, for: season, limit: limit, offset: offset)
    }
    
    /// Asynchronously fetches Formula 1 Circuits for all seasons throughout history.
    /// - Parameters:
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: A model representing Circuits
    func allCircuits(limit: String? = nil, offset: String? = nil) async throws -> Circuits {
        try await URLSession.shared.fetch(.circuits, limit: limit, offset: offset)
    }
    
    /// Asynchronously fetches Formula 1 Drivers - either all, or for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    /// - Returns: A model representing Drivers
    func drivers(for season: Season, limit: String? = nil, offset: String? = nil) async throws -> Drivers {
        try await URLSession.shared.fetch(.drivers, for: season, limit: limit, offset: offset)
    }
    
    /// Asynchronously fetches Formula 1 Seasons throughout history.
    /// - Parameters:
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: A model representing Seasons
    func seasons(limit: String? = nil, offset: String? = nil) async throws -> Seasons {
        try await URLSession.shared.fetch(.seasons, limit: limit, offset: offset)
    }
    
    /// Asynchronously fetches Formula 1 Constructors for all seasons throughout history.
    /// - Parameters:
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: A model representing Constructors
    func allConstructors(limit: String? = nil, offset: String? = nil) async throws -> Constructors {
        try await URLSession.shared.fetch(.constructors, limit: limit, offset: limit)
    }
    
    /// Asynchronously fetches Formula 1 Constructors for all seasons throughout history.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: A model representing Constructors
    func constructors(for season: Season, limit: String? = nil, offset: String? = nil) async throws -> Constructors {
        try await URLSession.shared.fetch(.constructors, for: season, limit: limit, offset: limit)
    }
    
    /// Asynchronously fetch Formula 1 Driver standings for a given year
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: a model object that represents the driver standings for the specified year
    public static func driverStandings(for season: Season, limit: String? = nil, offset: String? = nil) async throws -> DriverStandings {
        try await URLSession.shared.fetch(.driverStandings, for: season, limit: limit, offset: limit)
    }
    
    /// Asynchronously fetch Formula 1 Constructor standings for a given year
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: a model object that represents the driver standings for the specified year
    public static func constructorStandings(for season: Season, limit: String? = nil, offset: String? = nil) async throws -> ConstructorStandings {
        try await URLSession.shared.fetch(.constructorStandings, for: season, limit: limit, offset: limit)
    }
    
    /// Asynchronously fetches Formula 1 Race Schedule for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: A model representing a Race Schedule
    func raceSchedule(for season: Season, limit: String? = nil, offset: String? = nil) async throws -> RaceSchedule {
        let raceSchedule: RaceSchedule = try await URLSession.shared.fetch(.raceSchedule, for: season, limit: limit, offset: offset)
        return raceSchedule
    }
    
    /// Asynchronously fetches Formula 1 Race Results for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: A model that represents a race result.
    func raceResults(for season: Season, limit: String? = nil, offset: String? = nil) async throws -> RaceResults {
        try await URLSession.shared.fetch(.raceResults, for: season, limit: limit, offset: offset)
    }
    
    /// Fetches Qualifying Results for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    /// - Returns: A model that represents a qualifying result.
    func qualifyingResults(for season: Season, limit: String? = nil, offset: String? = nil) async throws -> QualifyingResults {
        try await URLSession.shared.fetch(.qualifyingResults, for: season, limit: limit, offset: offset)
    }
    
    /// Asynchronously fetches Pit Stops for a given year and round.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - round: A race within the season.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    /// - Returns: A model representing pit stops.
    func pitStops(for season: Season, round: String, limit: String? = nil, offset: String? = nil) async throws -> PitStops {
        try await URLSession.shared.fetch(.pitStops, for: season, round: round, limit: limit, offset: offset)
    }
    
    /// Asynchronously fetches lap times for a lap within a race.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - round: A race within the season.
    ///   - lap: Lap of given race.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    /// - Returns: A model that represents laps.
    func laps(for season: Season, round: String, lap: String? = nil, limit: String? = nil, offset: String? = nil) async throws -> Laps {
        try await URLSession.shared.fetch(.lapTimes(lap), for: season, round: round, limit: limit, offset: offset)
    }
    
    /// Asynchronously fetches finishing status for given season.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year.
    ///   - round: A race within the season.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    /// - Returns: A model that represents a finishing status.
    func finishingStatus(
        for season: Season,
        round: String? = nil,
        limit: String? = nil,
        offset: String? = nil
    ) async throws -> FinishingStatus {
        try await URLSession.shared.fetch(.finishingStatus, for: season, limit: limit, offset: offset)
    }
}
