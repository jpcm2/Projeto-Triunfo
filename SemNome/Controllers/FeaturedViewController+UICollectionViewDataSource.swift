//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  SemNome
//
//  Created by jpcm2 on 12/07/22.
//
import UIKit

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
            return makePopularCell(indexPath)
        }else if(collectionView == nowPlayingCollectionView){
            return makeNowPlayingCell(indexPath)
        }else if(collectionView == upComingCollectionView){
            return makeUpcomingCell(indexPath)
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let celula = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell{
            celula.titleLabel.text = popularMovies[indexPath.row].title
            celula.movieImage.image = UIImage(named: popularMovies[indexPath.row].poster)
            return celula
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let celula = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell{
            let nowPlayingTitle: String = nowPlayingMovies[indexPath.row].title
            celula.titleLabel.text = nowPlayingTitle
            let nowPlayingImage: UIImage? = UIImage(named: nowPlayingMovies[indexPath.row].poster)
            celula.nowPlayingImage.image = nowPlayingImage
            let nowPlayingDate: String = String(nowPlayingMovies[indexPath.row].releaseDate.prefix(4))
            celula.dateLabel.text = nowPlayingDate
            return celula
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpComingCollectionViewCell {
        if let celula = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: UpComingCollectionViewCell.cellIdentifier, for: indexPath) as? UpComingCollectionViewCell{
            celula.titleLabel.text = upcomingMovies[indexPath.row].title
            celula.upcomingImage.image = UIImage(named: upcomingMovies[indexPath.row].poster)
            celula.dateLabel.text = upcomingMovies[indexPath.row].releaseDate
            return celula
        }
        return UpComingCollectionViewCell()
    }
    
}


