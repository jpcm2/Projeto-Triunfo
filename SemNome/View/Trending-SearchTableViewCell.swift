//
//  TrendingTableViewCell.swift
//  SemNome
//
//  Created by jpcm2 on 18/07/22.
//

import UIKit

class TrendingSearchTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    
    func setup(title: String, date: String, image: UIImage){
        self.titleLabel.text = title
        self.yearLabel.text = date
        self.posterImage.image = image
    }
}
