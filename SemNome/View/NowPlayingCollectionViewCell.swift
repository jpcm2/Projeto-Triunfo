//
//  NowPlayingCollectionViewCell.swift
//  SemNome
//
//  Created by jpcm2 on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var nowPlayingImage: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(image: UIImage, date: String, title: String){
        self.dateLabel.text = date
        self.titleLabel.text = title
        self.nowPlayingImage.image = image
    }
}
