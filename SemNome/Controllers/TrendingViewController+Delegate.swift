//
//  TrendingViewController+Delegate.swift
//  SemNome
//
//  Created by jpcm2 on 18/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(state == 0){
            //Ta na aba today
            let movie: Movie = trendingMoviesToday[indexPath.item]
            self.performSegue(withIdentifier: "datailsSegue", sender: movie)
        }else{
            let movie: Movie = trendingMoviesThisWeek[indexPath.item]
            self.performSegue(withIdentifier: "datailsSegue", sender: movie)
        }
    }
}
