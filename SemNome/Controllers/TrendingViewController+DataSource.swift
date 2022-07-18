//
//  TrendingViewController+DataSource.swift
//  SemNome
//
//  Created by jpcm2 on 18/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = trandingTableVIew.dequeueReusableCell(withIdentifier: "trendingCell", for: indexPath) as? TrendingTableViewCell{
            cell.setup(title: trendingMovies[indexPath.item].title, date: String(trendingMovies[indexPath.item].releaseDate.prefix(4)), image: UIImage())
            let movie = trendingMovies[indexPath.item]
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, date: String(trendingMovies[indexPath.item].releaseDate.prefix(4)), image: imagem)
            }
            return cell
        }
        return UITableViewCell()
    }
}
