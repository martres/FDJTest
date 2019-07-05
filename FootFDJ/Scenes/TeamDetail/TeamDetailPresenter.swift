//
//  TeamDetailPresenter.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamDetailPresentationLogic {
    func showPlayers(_ response: TeamDetail.getPlayers.Response)
    func showError(_ error: Error)
}

class TeamDetailPresenter: TeamDetailPresentationLogic {
    
    weak var viewController: TeamDetailDisplayLogic?
    
    func showPlayers(_ response: TeamDetail.getPlayers.Response) {
        let players = response.players.map {
            TeamDetail.getPlayers.ViewModel.Player(name: $0.name,
                                                   pictureURL: $0.getPicture(),
                                                   position: $0.position,
                                                   price: $0.price,
                                                   birthDate: $0.birthDate) }
        viewController?.showPlayers(.init(players: players))
    }
    
    func showError(_ error: Error) {
        viewController?.showError(error)
    }
    
}
