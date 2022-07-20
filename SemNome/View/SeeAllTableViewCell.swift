//
//  SeeAllTableViewCell.swift
//  SemNome
//
//  Created by jpcm2 on 20/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(title: String, date: String, image: UIImage, rating: String){
        self.titleLabel.text = title
        self.dateLabel.text = date
        self.posterImage.image = image
        self.ratingLabel.text = rating
    }
}
