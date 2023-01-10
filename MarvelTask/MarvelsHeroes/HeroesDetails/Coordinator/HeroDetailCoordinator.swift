//
//  HeroDetailCoordinator.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import UIKit

final class HeroDetailCoordinator: Coordinator {
    //MARK: - Variables
    private let navigator: NavigationController
    private var viewController: UIViewController?
    private let selectedHero: Hero
    
    init(navigator: NavigationController,
         selectedHero: Hero
    ) {
        self.navigator = navigator
        self.selectedHero = selectedHero
    }
    //MARK: - Navigator
    func start() {
        let viewModel = HeroDetailViewModel( hero: selectedHero)
        let viewController = MarvelHeroesDetailViewController(viewModel: viewModel)
        navigator.pushViewController(viewController, animated: true)
        self.viewController = viewController
    }
}
