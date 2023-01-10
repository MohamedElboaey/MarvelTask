//
//  HeroesListViewModelGetaway.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 10/01/2023.
//

import Foundation

protocol HeroesListViewModelGetawayProtocol{
    func loadHeroes(currentPage: Int, completion: @escaping (([Hero],Int) -> Void))
    func searchHeroes(heroName: String, completion: @escaping (([Hero]) -> Void))
}

class HeroesListViewModelGetaway: HeroesListViewModelGetawayProtocol {
    private let service: HeroesListService
    init(service: HeroesListService = HeroesListService()) {
        self.service = service
    }
     func loadHeroes(currentPage: Int, completion: @escaping (([Hero],Int) -> Void)) {
        service.loadHeroes(currentPage: currentPage) { heroInfo in
            let heroesData = heroInfo.data
            completion(heroesData.results, heroesData.total)
        }
    }
     func searchHeroes(heroName: String, completion: @escaping (([Hero]) -> Void)) {
        service.searchHeroes(heroName: heroName) { heroInfo in
            let heroesData = heroInfo.data
            completion(heroesData.results)
        }
    }
}

