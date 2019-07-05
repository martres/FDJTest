//
//  LeagueListWorker.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

typealias LeagueFetcher = NetworkManager<Leagues>
typealias TeamsFetcher = NetworkManager<Teams>
typealias TeamListResult = Result<[Team], Error>
typealias LeagueResult = Result<[League], Error>

class TeamListWorker
{
    lazy var teamsFetcher = TeamsFetcher()
    lazy var leagueFetcher = LeagueFetcher()
    
    func getLeagues(completion: @escaping (LeagueResult) -> ()) {
        leagueFetcher.fetchData(.leagues) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let leagues): completion(.success(leagues.leagues))
            }
            
        }
    }
    
    func getTeams(for text: String, completion: @escaping (TeamListResult) -> ()) {
        teamsFetcher.fetchData(.teams(text)) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let teams): completion(.success(teams.teams))
            }
        }
    }
}
