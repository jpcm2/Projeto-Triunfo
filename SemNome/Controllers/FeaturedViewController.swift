//
//  FeaturedViewController.swift
//  SemNome
//
//  Created by jpcm2 on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upComingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
    }
}

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        
        celula?.titleLabel.text = "Tituro do Filme"
        celula?.movieImage.image = UIImage()
        
        return celula ?? UICollectionViewCell()
    }
}


