//
//  HeroesListViewModelMock.swift
//  MarvelsHeroesTests
//
//  Created by Mohamed Elboraey on 10/01/2023.
//

import XCTest
@testable import MarvelsHeroes

final class HeroesListViewModelSpec: XCTestCase {
    
    var viewModel: HeroesListViewModel!
    var heroesListGetawayMock: HeroesListGetawayMock!
    
    override func setUp() {
        heroesListGetawayMock = HeroesListGetawayMock()
        viewModel = .init(getaway: heroesListGetawayMock)
    }
}
