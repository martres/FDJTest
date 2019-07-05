//
//  TeamListRouter.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamListRoutingLogic {
    func showTeamDetail()
}

protocol TeamListDataPassing
{
    var dataStore: TeamListDataStore? { get }
}

class TeamListRouter: NSObject, TeamListRoutingLogic, TeamListDataPassing
{
    weak var viewController: TeamListViewController?
    var dataStore: TeamListDataStore?
    
    // MARK: Routing
    
    func showTeamDetail() {
        guard let team = dataStore?.teamSelected else { return }
        let vc = TeamDetailBuilder.build(with: team)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
