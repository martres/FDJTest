//
//  TeamDetailPresenter.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamDetailPresentationLogic
{
  func presentSomething(response: TeamDetail.Something.Response)
}

class TeamDetailPresenter: TeamDetailPresentationLogic
{
  weak var viewController: TeamDetailDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: TeamDetail.Something.Response)
  {
    let viewModel = TeamDetail.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
