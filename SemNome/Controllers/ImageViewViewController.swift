//
//  ImageViewViewController.swift
//  SemNome
//
//  Created by jpcm2 on 19/07/22.
//

import UIKit

class ImageViewViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    var imagemFromSegue: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(imagemFromSegue)
        self.image.image = imagemFromSegue
    }
}
