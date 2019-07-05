//
//  TeamListViewController.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright (c) 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TeamListDisplayLogic: class {
    func showLeagues(_ leagues: [TeamList.getLeagues.ViewModel.League])
    func showTeams(_ teams: [TeamList.getTeams.ViewModel.Team])
    func showError(_ error: Error)
}

class TeamListViewController: UIViewController, TeamListDisplayLogic {
    
    @IBOutlet private weak var teamsCollectionView: UICollectionView!
    @IBOutlet private weak var completionTableView: UITableView!
    
    var searchController = UISearchController(searchResultsController: nil)
    
    var interactor: TeamListBusinessLogic?
    var router: (NSObjectProtocol & TeamListRoutingLogic & TeamListDataPassing)?
    
    var leagues: [TeamList.getLeagues.ViewModel.League] = [] {
        didSet {
            DispatchQueue.main.async {
                self.completionTableView.reloadData()
            }
        }
    }
    var teams: [TeamList.getTeams.ViewModel.Team] = [] {
        didSet {
            DispatchQueue.main.async {
                self.teamsCollectionView.reloadData()
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupCompletionView()
        setupSearchController()
        interactor?.getLeagues()
    }
    
    private func setupCompletionView() {
        completionTableView.delegate = self
        completionTableView.dataSource = self
        completionTableView.tableFooterView = UIView()
    }
    
    private func setupSearchController() {
        searchController = {
            let search = UISearchController(searchResultsController: nil)
            search.searchBar.placeholder = "Search a soccer league"
            search.searchResultsUpdater = self
            search.obscuresBackgroundDuringPresentation = false
            search.hidesNavigationBarDuringPresentation = false
            return search
        }()
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
    }
    
    private func setupCollectionView() {
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        teamsCollectionView.register(UINib(nibName: TeamViewCell.typeName, bundle: nil), forCellWithReuseIdentifier: TeamViewCell.typeName)
    }
    
    // MARK: Logic
    
    func showTeams(_ teams: [TeamList.getTeams.ViewModel.Team]) {
        self.teams = teams
    }
    
    func showLeagues(_ leagues: [TeamList.getLeagues.ViewModel.League]) {
        completionTableView.isHidden = leagues.isEmpty
        self.leagues = leagues
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "An error occured", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
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
}

extension TeamListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        interactor?.searchLeagues(request: .init(text: text))
    }
    
}

extension TeamListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamViewCell.typeName, for: indexPath) as? TeamViewCell else {
            fatalError("\(TeamViewCell.typeName) ERROR")
        }
        cell.setup(teams[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension TeamListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let team = teams[indexPath.row]
    }
    
}
