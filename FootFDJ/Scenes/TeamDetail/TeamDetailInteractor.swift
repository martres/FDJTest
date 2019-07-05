//
//  TeamDetailInteractor.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamDetailBusinessLogic
{
    func doSomething(request: TeamDetail.Something.Request)
}

protocol TeamDetailDataStore
{
    //var name: String { get set }
}

class TeamDetailInteractor: TeamDetailBusinessLogic, TeamDetailDataStore {
    
    var presenter: TeamDetailPresentationLogic?
    var worker: TeamDetailWorker?
    
    // MARK: Do something
    
    func doSomething(request: TeamDetail.Something.Request)
    {
        worker = TeamDetailWorker()
        worker?.doSomeWork()
        
        let response = TeamDetail.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
