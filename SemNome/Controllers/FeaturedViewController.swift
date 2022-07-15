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
    
    var popularMovies: [Movie] = []
    let nowPlayingMovies: [Movie] = Movie.nowPlayingMovies()
    let upcomingMovies: [Movie] = Movie.upcomingMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upComingCollectionView.dataSource = self
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upComingCollectionView.delegate = self
        
        Task{
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}
