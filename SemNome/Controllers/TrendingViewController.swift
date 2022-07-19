//
//  TrendingViewController.swift
//  SemNome
//
//  Created by jpcm2 on 18/07/22.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet var trendingTableView: UITableView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    var state: Int = 0
    
    var trendingMoviesToday: [Movie] = []
    var trendingMoviesThisWeek: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trendingTableView.delegate = self
        trendingTableView.dataSource = self
        Task {
            self.trendingMoviesToday = await Movie.trendingTodayAPI()
            self.trendingMoviesThisWeek = await Movie.trendingThisWeekAPI()
            self.trendingTableView.reloadData()
        }
    }
    
    @IBAction func segmentedControll(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            state = 0
        }else{
            state = 1
        }
        trendingTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}
