//
//  LeagueListPresenter.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamListPresentationLogic {
    func showError(_ error: Error)
    func showLeagues(response: TeamList.getLeagues.Response)
    func showTeams(response: TeamList.getTeams.Response)
}

class TeamListPresenter: TeamListPresentationLogic {
    
    weak var viewController: TeamListDisplayLogic?
    
    func showTeams(response: TeamList.getTeams.Response) {
        let teams = response.teams.map { TeamList.getTeams.ViewModel.Team(name: $0.teamName, urlLogo: $0.teamBadge)}
        viewController?.showTeams(teams)
    }
    
    func showError(_ error: Error) {
        viewController?.showError(error)
    }
    
    func showLeagues(response: TeamList.getLeagues.Response) {
        let leagues = response.leagues.map { TeamList.getLeagues.ViewModel.League(name: $0.strLeague) }
        viewController?.showLeagues(leagues)
    }
}
