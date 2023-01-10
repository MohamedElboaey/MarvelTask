//
//  MarvelHeroesViewController.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import UIKit

protocol MarvelHeroesViewControllerDelegate: AnyObject {
    func didSelectRowAt(selectedHero: Hero)
}

final class MarvelHeroesViewController: UIViewController {
    //    MARK: -> IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    //    MARK: -> Variables
    let viewModel: HeroesListViewModel
    var heroes: [Hero] = []
    weak var delegate: MarvelHeroesViewControllerDelegate?
    
    init(viewModel: HeroesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: -> ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad(delegate: self)
        self.title = "Heroes"
        tableView.register(UINib(nibName: "MarvelHeroCell", bundle: nil), forCellReuseIdentifier: "MarvelHeroCell")
    }
}
//MARK: -> Extension
extension MarvelHeroesViewController: HeroesListViewModelDelegate {
    func setupSearchBar(title: String) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = title
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func tableViewReloadData() {
        tableView.reloadData()
    }
    func setHeroes(heroes: [Hero]) {
        self.heroes = heroes
    }
    func setTitle(_ title: String) {
        self.title = title
    }
}
extension MarvelHeroesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchBarSearchButtonClicked(inputText: searchBar.text )
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchBarCancelButtonClicked()
    }
}
