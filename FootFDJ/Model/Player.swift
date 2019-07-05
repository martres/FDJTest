//
//  Player.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

struct Players: Codable {
    let players: [Player]
}

struct Player: Codable {
    let name: String
    let pictureURL: String
    let position: String
    let price: String
    let birthDate: String
}
