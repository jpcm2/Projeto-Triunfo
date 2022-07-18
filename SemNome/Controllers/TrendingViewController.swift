//
//  TrendingViewController.swift
//  SemNome
//
//  Created by jpcm2 on 18/07/22.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet var trandingTableVIew: UITableView!
    
    var trendingMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trandingTableVIew.delegate = self
        trandingTableVIew.dataSource = self
        
        Task {
            self.trendingMovies = await Movie.trendingTodayAPI()
            print(trendingMovies)
            self.trandingTableVIew.reloadData()
        }
    }
}
