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
