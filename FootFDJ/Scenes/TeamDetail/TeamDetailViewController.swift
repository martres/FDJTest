//
//  TeamDetailViewController.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamDetailDisplayLogic: class
{
    func displaySomething(viewModel: TeamDetail.Something.ViewModel)
}

class TeamDetailViewController: UIViewController, TeamDetailDisplayLogic
{
    @IBOutlet private weak var playerTableView: UITableView!
    
    var interactor: TeamDetailBusinessLogic?
    var router: (NSObjectProtocol & TeamDetailRoutingLogic & TeamDetailDataPassing)?
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = TeamDetailInteractor()
        let presenter = TeamDetailPresenter()
        let router = TeamDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = TeamDetail.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: TeamDetail.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}
