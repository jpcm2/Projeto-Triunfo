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
        nowPlayingCollectionView.dataSource = self
        upComingCollectionView.dataSource = self
        print(popularMovies)
    }
    
}

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == popularCollectionView){
            return popularMovies.count
        }else if(collectionView == nowPlayingCollectionView){
            return nowPlayingMovies.count
        }else if(collectionView == upComingCollectionView){
            return upcomingMovies.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == popularCollectionView){
            if let celula = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell{
                celula.titleLabel.text = popularMovies[indexPath.row].title
                celula.movieImage.image = UIImage(named: popularMovies[indexPath.row].poster)
                return celula
            }
        }else if(collectionView == nowPlayingCollectionView){
            if let celula = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell{
                celula.titleLabel.text = nowPlayingMovies[indexPath.row].title
                celula.nowPlayingImage.image = UIImage(named: nowPlayingMovies[indexPath.row].poster)
                celula.dateLabel.text = nowPlayingMovies[indexPath.row].releaseDate
                return celula
            }
        }else if(collectionView == upComingCollectionView){
            if let celula = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpComingCollectionViewCell{
                celula.titleLabel.text = upcomingMovies[indexPath.row].title
                celula.upcomingImage.image = UIImage(named: upcomingMovies[indexPath.row].poster)
                celula.dateLabel.text = upcomingMovies[indexPath.row].releaseDate
                return celula
            }
        }
        return UICollectionViewCell()
    }
}


