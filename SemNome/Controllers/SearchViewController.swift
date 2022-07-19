//
//  SearchViewController.swift
//  SemNome
//
//  Created by jpcm2 on 19/07/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchController = UISearchController()
    @IBOutlet var tableViewSearch: UITableView!
    var searchMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSearch.delegate = self
        self.tableViewSearch.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.backgroundColor = .white
        searchController.searchBar.layer.cornerRadius = 16
        navigationItem.searchController = searchController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}
