//
//  SeeAll+UITableViewDataSource.swift
//  SemNome
//
//  Created by jpcm2 on 19/07/22.
//

import UIKit

extension SeeAllViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seeAllMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "seeAllCell", for: indexPath) as? SeeAllTableViewCell {
            let movie = seeAllMovies[indexPath.item]
            cell.setup(title: movie.title, date: String((seeAllMovies[indexPath.item].releaseDate ?? "").prefix(4)), image: UIImage(), rating: "\(movie.voteAverage)")
                Task{
                    let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                    let imagem = UIImage(data: imageData) ?? UIImage()
                    cell.setup(title: movie.title, date: String((seeAllMovies[indexPath.item].releaseDate ?? "").prefix(4)), image: imagem, rating: "\(movie.voteAverage)")
                }
                return cell
        }
        return UITableViewCell()
    }
    
    
}
