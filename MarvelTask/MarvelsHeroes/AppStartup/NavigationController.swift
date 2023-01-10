//
//  NavigationController.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import UIKit

final class NavigationController: UINavigationController {
    func setupNavigation() {
        let navigationBarAppearance = UINavigationBar.appearance()
        
        navigationBarAppearance.tintColor = UIColor.init(displayP3Red: 159/100, green: 1/100, blue: 20/100, alpha: 1)
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(displayP3Red: 159/100, green: 1/100, blue: 20/100, alpha: 1)]
    }
}
