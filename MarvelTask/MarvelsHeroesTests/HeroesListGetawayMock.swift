//
//  HeroesListGetawayMock.swift
//  MarvelsHeroesTests
//
//  Created by Mohamed Elboraey on 10/01/2023.
//

@testable import MarvelsHeroes

final class HeroesListGetawayMock: HeroesListViewModelGetawayProtocol {
    func loadHeroes(currentPage: Int, completion: @escaping (([MarvelsHeroes.Hero], Int) -> Void)) {
        <#code#>
    }
    
    func searchHeroes(heroName: String, completion: @escaping (([MarvelsHeroes.Hero]) -> Void)) {
        <#code#>
    }
 
}
