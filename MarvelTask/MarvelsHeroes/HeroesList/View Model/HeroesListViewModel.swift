//
//  MarvelHeroesViewController.swift
//  Marvel's
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import UIKit

protocol HeroesListViewModelDelegate: AnyObject {
    func setHeroes(heroes: [Hero])
    func tableViewReloadData()
    func setupSearchBar(title: String)
}

final class HeroesListViewModel: ObservableObject {
    //    MARK: -> Variables
    fileprivate var getaway: HeroesListViewModelGetawayProtocol
    private weak var delegate: HeroesListViewModelDelegate?
    private var currentPage = 0
    private var total = 0
    private var heroes: [Hero] = []
    private var filteredHeroes: [Hero] = []
    init(getaway: HeroesListViewModelGetawayProtocol = HeroesListViewModelGetaway()) {
        self.getaway = getaway
    }
    
    //MARK: - View life cycle
    func viewDidLoad(delegate: HeroesListViewModelDelegate) {
        self.delegate = delegate
        loadHeroes()
        delegate.setupSearchBar(title: "Search hero")
    }
    func willDisplay(indexPath: Int) {
        if indexPath == heroes.count - 10 && heroes.count != total {
            currentPage += 1
        }
    }
    func loadHeroes() {
        getaway.loadHeroes(currentPage: currentPage, completion: { [weak self] heroes, total in
            self?.heroes = heroes
            self?.total = total
            self?.delegate?.setHeroes(heroes: self?.heroes ?? [])
            self?.delegate?.tableViewReloadData()
        })
    }
    //MARK: - Functions for search bar
    func searchBarSearchButtonClicked(inputText: String?) {
        guard let text = inputText, text.count >= 3 else {
            return
        }
        getaway.searchHeroes(heroName: text, completion: { [weak self] filteredHeroes in
            self?.filteredHeroes = filteredHeroes
            self?.delegate?.setHeroes(heroes: self?.filteredHeroes ?? [])
            self?.delegate?.tableViewReloadData()
        })
    }
    func searchBarCancelButtonClicked() {
        delegate?.setHeroes(heroes: heroes)
        delegate?.tableViewReloadData()
    }
}
