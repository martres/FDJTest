//
//  Player.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

struct Players: Codable {
    let player: [Player]
}

struct Player: Codable {
    let id: String
    let name: String
    let pictureFaceURL: String?
    let pictureThumbURL: String?
    let position: String
    let price: String
    let birthDate: String
    
    enum CodingKeys: String, CodingKey {
        case birthDate = "dateBorn"
        case id = "idPlayer"
        case name = "strPlayer"
        case position = "strPosition"
        case price = "strSigning"
        case pictureFaceURL = "strCutout"
        case pictureThumbURL = "strThumb"
    }
    
    func getPicture() -> String? {
        return pictureFaceURL ?? pictureThumbURL
    }
}
