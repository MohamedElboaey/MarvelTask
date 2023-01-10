//
//  MarvelHeroesDetailViewController.swift
//  MarvelsHeroes
//
//  Created by Mohamed Elboraey on 09/01/2023.
//


import UIKit

 class MarvelHeroesDetailViewController: UIViewController {
     //MARK: - IBOutlet
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroDescLabel: UILabel!
    //MARK: - Variables
    private let viewModel: HeroDetailViewModel
     init(viewModel: HeroDetailViewModel) {
         self.viewModel = viewModel
         super.init(nibName: nil, bundle: nil)
     }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
     //MARK: - UI
    func configView() {
        self.heroNameLabel.text = viewModel.hero.name
        self.heroDescLabel.text = viewModel.hero.description
        if self.heroDescLabel.text == "" {
            self.heroDescLabel.text = "This hero has no description"
        }
        guard let url = URL(string: viewModel.hero.thumbnail.url) else { return }
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
