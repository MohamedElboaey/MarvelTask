//
//  Loader.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 08/01/2023.
//

import UIKit
//MARK: - Extension for using UIActivityIndicatorView
final class Loader: UIActivityIndicatorView {
    init() {
        super.init(style: .medium)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(in view: UIView) {
        prepareLayout(in: view)
        start()
    }
    func prepareLayout(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    func start() {
        self.startAnimating()
    }
}
