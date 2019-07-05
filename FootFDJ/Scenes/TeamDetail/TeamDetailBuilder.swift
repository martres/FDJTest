//
//  TeamDetailBuilder.swift
//  FootFDJ
//
//  Created by Martreux Steven on 05/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation
import UIKit

struct TeamDetailBuilder {
    
    static func build(with team: Team) -> UIViewController {
        guard let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: TeamDetailViewController.typeName) as? TeamDetailViewController else {
            fatalError("\(TeamListViewController.typeName) not found")
        }
        let interactor = TeamDetailInteractor()
        let presenter = TeamDetailPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.team = team
        return viewController
    }
    
}
