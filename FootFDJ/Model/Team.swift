//
//  Team.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

struct Teams: Codable {
    let teams: [Team]
}

struct Team: Codable {

    let leagueIdentifier: String
    let teamIdentifier: String
    let leagueName: String
    let teamName: String
    let teamBadge: String
    
    enum CodingKeys: String, CodingKey {
        case leagueIdentifier = "idLeague"
        case teamIdentifier = "idTeam"
        case leagueName = "strLeague"
        case teamName = "strTeam"
        case teamBadge = "strTeamBadge"
    }
}
