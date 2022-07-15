//
//  DetailsViewController.swift
//  SemNome
//
//  Created by jpcm2 on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    @IBOutlet var bannerImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var ratingImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {
            return
        }
        self.title = movie.title
        self.bannerImage.image = UIImage(named: movie.backdrop)
        self.titleLabel.text = movie.title
        self.ratingImage.image = UIImage(named: movie.poster)
        self.ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        self.overviewLabel.text = movie.overview
    }
}
