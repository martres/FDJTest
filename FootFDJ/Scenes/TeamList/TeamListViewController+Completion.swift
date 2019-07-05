//
//  TeamListViewController+Completion.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation
import UIKit

extension TeamListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "LeaguesCell")
        cell.textLabel?.text = leagues[indexPath.row].name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension TeamListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = leagues[indexPath.row].name
        interactor?.getTeams(request: .init(nameLeague: name))
        searchController.isActive = false
        searchController.searchBar.text = name
        tableView.isHidden = true
    }
    
}
