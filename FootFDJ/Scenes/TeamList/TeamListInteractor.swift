//
//  TeamListInteractor.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamListBusinessLogic {
    func getLeagues()
    func searchLeagues(request: TeamList.getLeagues.Request)
    func getTeams(request: TeamList.getTeams.Request)
}

protocol TeamListDataStore {
    var leagues: [League] { get set }
    var teams: [Team] { get set }
}

class TeamListInteractor: TeamListBusinessLogic, TeamListDataStore
{
    var presenter: TeamListPresentationLogic?
    private let worker: TeamListWorker = TeamListWorker()
    
    var leagues: [League] = []
    var teams: [Team] = []
    
    func getLeagues() {
        worker.getLeagues { [weak self ] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let leagues):
                self.leagues = leagues.filter { $0.strSport == "Soccer" }
            case .failure(let error):
                self.presenter?.showError(error)
            }
        }
    }
    
    func searchLeagues(request: TeamList.getLeagues.Request) {
        let text = request.text.lowercased()
        let leaguesSearch = leagues.filter { $0.strLeague.lowercased().contains(text) }
        let response = TeamList.getLeagues.Response(leagues: leaguesSearch)
        presenter?.showLeagues(response: response)
    }
    
    func getTeams(request: TeamList.getTeams.Request) {
        guard let indexLeague = self.leagues.firstIndex(where: { $0.strLeague == request.nameLeague }) else {
            preconditionFailure("League doesnt exist")
        }
        
        // Avoid requesting a second time teams of a league
        let teams = leagues[indexLeague].teams
        if teams.isEmpty == false {
            presenter?.showTeams(response: TeamList.getTeams.Response(teams: teams))
            return
        }
        
        worker.getTeams(for: request.nameLeague) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let teams):
                let response = TeamList.getTeams.Response(teams: teams)
                self.presenter?.showTeams(response: response)
                self.leagues[indexLeague].teams = teams
            case .failure(let error):
                self.presenter?.showError(error)
            }
        }
    }
}
