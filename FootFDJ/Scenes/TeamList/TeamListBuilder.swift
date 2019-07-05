//
//  LeagueListBuilder.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation
import UIKit

struct TeamListBuilder {
    
    static func build() -> UIViewController {
        guard let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: TeamListViewController.typeName) as? TeamListViewController else {
            fatalError("\(TeamListViewController.typeName) not found")
        }
        let interactor = TeamListInteractor()
        let presenter = TeamListPresenter()
        let router = TeamListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
    
}
