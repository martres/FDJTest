//
//  TeamDetailInteractor.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamDetailBusinessLogic {
    func getPlayers(request: TeamDetail.getPlayers.Request)
}

class TeamDetailInteractor: TeamDetailBusinessLogic {
    
    var presenter: TeamDetailPresentationLogic?
    var worker: TeamDetailWorker?
    
    func getPlayers(request: TeamDetail.getPlayers.Request) {
        worker = TeamDetailWorker()
        worker?.getPlayers(for: request.teamName) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error): self.presenter?.showError(error)
            case .success(let players): self.presenter?.showPlayers(.init(players: players))
            }
        }
    }
}
