//
//  UpComingCollectionViewCell.swift
//  SemNome
//
//  Created by jpcm2 on 11/07/22.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var upcomingImage: UIImageView!
    
    func setup(title: String, date: String, image: UIImage){
        self.titleLabel.text = title
        self.dateLabel.text = date
        self.upcomingImage.image = image
    }
}
