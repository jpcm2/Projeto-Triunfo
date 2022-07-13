//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  SemNome
//
//  Created by jpcm2 on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie: Movie
        if(collectionView == self.popularCollectionView){
            movie = self.popularMovies[indexPath.row]
        }else if(collectionView == self.upComingCollectionView){
            movie = self.upcomingMovies[indexPath.row]
        }else{
            movie = self.nowPlayingMovies[indexPath.row]
        }
        self.performSegue(withIdentifier: "datailsSegue", sender: movie)
    }
}
