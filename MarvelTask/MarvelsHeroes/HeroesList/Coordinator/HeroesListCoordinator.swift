//
//  HeroesListCoordinator.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import UIKit

final class HeroesListCoordinator: Coordinator {
    //MARK: - Variables
    private let navigator: NavigationController
    private var nextCoordinator: Coordinator?
    
    init(navigator: NavigationController) {
        self.navigator = navigator
    }
    //MARK: - Start navigation
    func start() {
        let getaway = HeroesListViewModelGetaway()
        let viewModel = HeroesListViewModel(getaway: getaway)
        let viewController = MarvelHeroesViewController(viewModel: viewModel)
        viewController.delegate = self
        navigator.pushViewController(viewController, animated: true)
    }
}
//MARK: - Extensions for next screen
extension HeroesListCoordinator: MarvelHeroesViewControllerDelegate {
    func didSelectRowAt(selectedHero: Hero) {
        let nextCoordinator = HeroDetailCoordinator(navigator: navigator, selectedHero: selectedHero)
        nextCoordinator.start()
        self.nextCoordinator = nextCoordinator
    }
}
