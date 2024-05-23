//
//  NetworkService.swift
//  Formula 1
//
//  Created by Olya B on 17.05.2024.
//

import Foundation
import Alamofire

class NetworkService {
    func fetchRaces(completion: @escaping ([Race]) -> Void) {
        let url = "https://f1-api-json.herokuapp.com/api/v1/races"
        AF.request(url).responseDecodable(of: [Race].self) { response in
            switch response.result {
            case.success(let races):
                print("Received \(races.count) races.")
            case.failure(let error):
                print("Error: \(error)")
            }
        }
            
            
//            switch response.result {
//            case.success(let value):
//                guard let jsonArray = value as? [[String: Any]] else { return }
//                var races = [Race]()
//                for item in jsonArray {
//                    let race = Race(dictionary: item)
//                    if let safeRace = race {
//                        races.append(safeRace)
//                    }
//                }
//                completion(races)
//            case.failure(let error):
//                print("Failed to fetch races: \(error)")
//                completion([])
//            }
    }
}
