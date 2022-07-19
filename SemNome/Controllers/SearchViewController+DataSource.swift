//
//  SearchViewControllerTabBar.swift
//  SemNome
//
//  Created by jpcm2 on 19/07/22.
//

import UIKit

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "trendingCell", for: indexPath) as? TrendingSearchTableViewCell{
            let movie = searchMovies[indexPath.item]
        cell.setup(title: movie.title, date: String((searchMovies[indexPath.item].releaseDate ?? "").prefix(4)), image: UIImage())
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, date: String((searchMovies[indexPath.item].releaseDate ?? "").prefix(4)), image: imagem)
            }
            return cell
        }
        return UITableViewCell()
    }
}
