//
//  AppDelegate.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 07/01/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var coordinator: InitialCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = InitialCoordinator()
        coordinator?.start()
        return true
    }
}

