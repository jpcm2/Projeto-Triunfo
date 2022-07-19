//
//  SearchViewController+SearchResultingUpdating.swift
//  SemNome
//
//  Created by jpcm2 on 19/07/22.
//

import UIKit

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            Task{
                searchMovies = await Movie.searchAPI(busca: text)
                tableViewSearch.reloadData()
            }
        }
    }
}
