//
//  TeamDetailViewController.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamDetailDisplayLogic: class {
    func showPlayers(_ viewModel: TeamDetail.getPlayers.ViewModel)
    func showError(_ error: Error)
}

class TeamDetailViewController: UIViewController, TeamDetailDisplayLogic
{
    @IBOutlet private weak var playerTableView: UITableView!
    
    var players: [TeamDetail.getPlayers.ViewModel.Player] = [] {
        didSet {
            DispatchQueue.main.async {
                self.playerTableView.reloadData()
            }
        }
    }
    var team: Team?
    var interactor: TeamDetailBusinessLogic?
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = team?.teamName
        getPlayers()
        setupPlayerTableView()
    }
    
    func setupPlayerTableView() {
        playerTableView.dataSource = self
        playerTableView.register(UINib(nibName: PlayerViewCell.typeName, bundle: nil), forCellReuseIdentifier: PlayerViewCell.typeName)
        playerTableView.rowHeight = 120
    }
    
    func getPlayers() {
        guard let team = team else {
            assertionFailure("Team detail doesnt work without a team")
            return
        }
        interactor?.getPlayers(request: .init(teamName: team.teamName))
    }
    
    func showPlayers(_ viewModel: TeamDetail.getPlayers.ViewModel) {
        players = viewModel.players
    }
    
    func showError(_ error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "An error occured", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension TeamDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerViewCell.typeName, for: indexPath) as? PlayerViewCell else {
            fatalError("\(PlayerViewCell.typeName) not found")
        }
        cell.setup(with: players[indexPath.row])
        return cell
    }    
}
