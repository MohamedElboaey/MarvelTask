//
//  MarvelHeroCell.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//

import UIKit

final class MarvelHeroCell: UITableViewCell {
    //    MARK: -> IBOutlets
    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var lblName: UILabel!
    //    MARK: -> Function for prepare Cell
    func prepareCell(with hero: Hero) {
        lblName.text = hero.name
        guard let url = URL(string: hero.thumbnail.url) else { return }
        let loader = Loader()
        heroImage.addSubview(loader)
        loader.setup(in: heroImage)
        ImageCache.load(url: url) { image in
            DispatchQueue.main.async {
                self.heroImage.image = image
                loader.removeFromSuperview()
            }
        }
    }
}
