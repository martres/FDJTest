//
//  TeamDetailModels.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

enum TeamDetail
{
  // MARK: Use cases
  
  enum getPlayers
  {
    struct Request {
        var teamName: String
    }
    
    struct Response {
        var players: [Player]
    }
    
    struct ViewModel {
        var players: [Player]
        
        struct Player {
            let name: String
            let pictureURL: String?
            let position: String
            let price: String
            let birthDate: String
        }
    }
  }
}
