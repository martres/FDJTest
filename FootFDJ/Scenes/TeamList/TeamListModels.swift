//
//  LeagueListModels.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

enum TeamList
{
    // MARK: Use cases
    
    enum getTeams {
        struct Request {
            var nameLeague: String
        }
        
        struct Response {
            var teams: [Team]
        }
        
        struct ViewModel {
            let teams: [Team]
            
            struct Team {
                let name: String
                let urlLogo: String
            }
        }
    }
    
    enum getLeagues {
        struct Request {
            var text: String
        }
        
        struct Response {
            var leagues: [League]
        }
        
        struct ViewModel {
            let leagues: [League]
            
            struct League {
                var name: String
            }
        }
    }
}
