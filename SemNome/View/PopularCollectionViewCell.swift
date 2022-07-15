//
//  PopularCollectionViewCell.swift
//  SemNome
//
//  Created by jpcm2 on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "popularCell"
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(title: String, image: UIImage){
        self.titleLabel.text = title
        self.movieImage.image = image
    }
}
