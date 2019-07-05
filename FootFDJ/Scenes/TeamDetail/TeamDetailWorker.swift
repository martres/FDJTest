//
//  TeamDetailWorker.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

typealias PlayerFetcher = NetworkManager<Players>
typealias PlayerResult = Result<[Player], Error>

class TeamDetailWorker {
    
    lazy var playersFetcher = PlayerFetcher()
    
    func getPlayers(for teamName: String, completion: @escaping (PlayerResult) -> ()) {
        playersFetcher.fetchData(.players(teamName)) { result in
            switch result {
            case .success(let players): completion(.success(players.player))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
