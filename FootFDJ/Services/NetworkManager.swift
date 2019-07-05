//
//  ApiManager.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

private let baseUrl: String = "https://www.thesportsdb.com/api/v1/json/1/"

enum FDJURLBuilder {
    case leagues
    case players(_ team: String)
    case teams(_ search: String)
    
    func url() -> URL {
        switch self {
        case .leagues:
            return URL(string: "\(baseUrl)all_leagues.php")!
        case .teams(let search):
            return URL(string: "\(baseUrl)search_all_teams.php?l=\(search.replacingOccurrences(of: " ", with: "%20"))")!
        case .players(let team):
            return URL(string: "\(baseUrl)searchplayers.php?t=\(team.replacingOccurrences(of: " ", with: "%20"))")!
        }
    }
}

class NetworkManager<T: Codable> {
    
    private let session: URLSession = .shared
    
    func fetchData(_ urlBuilder: FDJURLBuilder, completion: @escaping (Result<T, Error>) -> ()) {
        session.dataTask(with: urlBuilder.url()) { (data, response, error) in
            
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
