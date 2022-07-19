//
//  SeaeAllViewController.swift
//  SemNome
//
//  Created by jpcm2 on 19/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var seeAllMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
