//
//  InitialCoordinator.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
}

final class InitialCoordinator: Coordinator {
    //MARK: - Variables
    private let window: UIWindow
    private let navigator: NavigationController
    private var nextCoordinator: Coordinator?
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
         navigator: NavigationController = NavigationController()
    ) {
        self.window = window
        self.navigator = navigator
    }
    //MARK: - RootViewController function
    func start() {
        window.rootViewController = navigator
        window.makeKeyAndVisible()
        navigator.navigationBar.prefersLargeTitles = true
        navigator.setupNavigation()
        let nextCoordinator = HeroesListCoordinator(navigator: navigator)
        nextCoordinator.start()
        self.nextCoordinator = nextCoordinator
    }
}
