//
//  League.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

struct Leagues: Codable {
    let leagues: [League]
}

struct League: Codable {
    let idLeague: String
    let strLeague: String
    let strSport: String
    
    var teams: [Team] = []
    
    enum CodingKeys: String, CodingKey {
        case idLeague = "idLeague"
        case strLeague = "strLeague"
        case strSport = "strSport"
    }
}
