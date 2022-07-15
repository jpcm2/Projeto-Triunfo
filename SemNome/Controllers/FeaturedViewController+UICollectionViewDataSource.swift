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
            celula.setup(title: popularMovies[indexPath.item].title,
                         image: UIImage())
            let movie = popularMovies[indexPath.item]
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                celula.setup(title: movie.title, image: imagem)
            }
            return celula
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let celula = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell{
            let titleFormatado = String(nowPlayingMovies[indexPath.row].releaseDate.prefix(4))
            celula.setup(image: UIImage(named: nowPlayingMovies[indexPath.row].posterPath) ?? UIImage(),
                         date: titleFormatado,
                         title: nowPlayingMovies[indexPath.row].title)
            return celula
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpComingCollectionViewCell {
        if let celula = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: UpComingCollectionViewCell.cellIdentifier, for: indexPath) as? UpComingCollectionViewCell{
            celula.setup(title: upcomingMovies[indexPath.row].title,
                         date: upcomingMovies[indexPath.row].releaseDate,
                         image: UIImage(named: upcomingMovies[indexPath.row].posterPath) ?? UIImage())
            return celula
        }
        return UpComingCollectionViewCell()
    }
    
}
