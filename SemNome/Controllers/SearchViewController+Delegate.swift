//
//  SearchViewController+Delegate.swift
//  SemNome
//
//  Created by jpcm2 on 19/07/22.
//

import UIKit

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie = searchMovies[indexPath.item]
        self.performSegue(withIdentifier: "datailsSegue", sender: movie)
    }
}
