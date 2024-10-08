//
//  Path.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

enum Path {
    private static let basePath = "/ergast/f1"
    
    /// Circuits (all, specific season)
    case circuits
    
    /// Constructors(all, specific season)
    case constructors
    
    /// Constructor Standings (all, specific season)
    case constructorStandings
    
    /// Drivers (all, specific season).
    case drivers
    
    /// Driver Standings.
    case driverStandings
    
    /// Finishing Status
    case finishingStatus
    
    /// Lap Times.
    case lapTimes(String?)
    
    /// Pit Stops.
    case pitStops
    
    /// Race Schedule.
    case raceSchedule
    
    /// Race Results.
    case raceResults
    
    /// Race Standings (all, specific season).
    case raceStandings
    
    /// Seasons throughout history.
    case seasons
    
    /// Qualifying Results for a given year.
    case qualifyingResults
}

extension Path {
    /// Function that generates the path for an endpoint within the API.
    /// - Parameter season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).  Data for historical seasons will be fetched if nil.
    /// - Returns: String to be added to the Endpoint path.
    private func subPath(for season: Season? = nil, round: String? = nil) -> String {
        let year = season?.query ?? ""
        let race = round ?? ""
        
        switch self {
        case .circuits:
            return "\(year)/circuits.json"
        case .constructors:
            return "\(year)/constructors.json"
        case .constructorStandings:
            return "\(year)/constructorStandings.json"
        case .drivers:
            return "\(year)/drivers.json"
        case .driverStandings:
            return "\(year)/driverStandings.json"
        case .finishingStatus:
            if race != "" {
                return "\(year)/\(race)/status.json"
            }
            return "\(year)/status.json"
            
        case .lapTimes(let lap):
            if let lap = lap {
                 return "\(year)/\(race)/laps/\(lap).json"
            }
            return "\(year)/\(race)/laps.json"
            
        case .pitStops:
            return "\(year)/\(race)/pitstops.json"
        case .raceSchedule:
            return "\(year).json"
        case .raceResults:
            return "\(year)/results.json"
        case .raceStandings:
            return "\(year)/results.json"
        case .seasons:
            return "/seasons.json"
        case .qualifyingResults:
            return "\(year)/qualifying.json"
        }
    }
    
    /// Constructs a path.
    /// - Parameter season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020). All historical seasons will be fetched if nil.
    /// - Returns: String representing a URL path.
    func urlPath(for season: Season?, round: String?, lap: String?) -> String {
        return Path.basePath + subPath(for: season, round: round)
    }
    
    /// Returns a Decodable type for a given endpoint.
    var decodingType: Decodable.Type {
        switch self {
        case .circuits: return Circuits.self
        case .constructors: return Constructors.self
        case .drivers: return Drivers.self
        case .driverStandings: return DriverStandings.self
        case .constructorStandings: return ConstructorStandings.self
        case .finishingStatus: return FinishingStatus.self
        case .lapTimes: return Laps.self
        case .seasons: return Seasons.self
        case .pitStops: return PitStops.self
        case .raceResults: return RaceResults.self
        case .raceSchedule: return RaceSchedule.self
        case .qualifyingResults: return QualifyingResults.self
        default: fatalError("Must provide Decodable type for enum case")
        }
    }
}
