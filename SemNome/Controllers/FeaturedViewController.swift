//
//  FeaturedViewController.swift
//  SemNome
//
//  Created by jpcm2 on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upComingCollectionView: UICollectionView!
    
    let popularMovies: [Movie] = Movie.popularMovies()
    let nowPlayingMovies: [Movie] = Movie.nowPlayingMovies()
    let upcomingMovies: [Movie] = Movie.upcomingMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        print(popularMovies)
    }
    
}

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell{
            
            celula.titleLabel.text = popularMovies[indexPath.row].title
            celula.movieImage.image = UIImage(named: popularMovies[indexPath.row].poster)
            
            return celula
            
        }
        return UICollectionViewCell()
    }
}


