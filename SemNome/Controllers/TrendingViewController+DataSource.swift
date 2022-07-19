//
//  TrendingViewController+DataSource.swift
//  SemNome
//
//  Created by jpcm2 on 18/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(state == 0){
            return trendingMoviesToday.count
        }else{
            return trendingMoviesThisWeek.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if(state == 0){
            let cell = trendingTableView.dequeueReusableCell(withIdentifier: "trendingCell", for: indexPath) as! TrendingTableViewCell
            let movie = trendingMoviesToday[indexPath.item]
        cell.setup(title: movie.title, date: String(trendingMoviesToday[indexPath.item].releaseDate.prefix(4)), image: UIImage())
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, date: String(trendingMoviesToday[indexPath.item].releaseDate.prefix(4)), image: imagem)
            }
            return cell
        }else{
            let cell = trendingTableView.dequeueReusableCell(withIdentifier: "trendingCell", for: indexPath) as! TrendingTableViewCell
            let movie = trendingMoviesThisWeek[indexPath.item]
        cell.setup(title: movie.title, date: String(trendingMoviesThisWeek[indexPath.item].releaseDate.prefix(4)), image: UIImage())
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, date: String(trendingMoviesThisWeek[indexPath.item].releaseDate.prefix(4)), image: imagem)
            }
            return cell
        }
    }
}
