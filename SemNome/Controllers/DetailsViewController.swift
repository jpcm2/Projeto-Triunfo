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
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .black
        guard let movie = movie else {
            return
        }
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
            let imagem = UIImage(data: imageData) ?? UIImage()
            let imagemDataPoster = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let posterImage = UIImage(data: imagemDataPoster) ?? UIImage()
            self.ratingImage.image = posterImage
            self.bannerImage.image = imagem
        }
        self.title = movie.title
        self.titleLabel.text = movie.title
        self.ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        self.overviewLabel.text = movie.overview
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ImageViewViewController{
            destination.imagemFromSegue = self.ratingImage.image
        }
    }
}
