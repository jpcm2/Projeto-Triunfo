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
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.bannerImage.image = imagem
        }
        
        self.title = movie.title
        self.titleLabel.text = movie.title
        self.ratingImage.image = UIImage(named: movie.posterPath)
        self.ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        self.overviewLabel.text = movie.overview
    }
}
