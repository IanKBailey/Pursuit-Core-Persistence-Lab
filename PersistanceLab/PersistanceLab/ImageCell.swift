//
//  ImageCell.swift
//  PersistanceLab
//
//  Created by Ian Bailey on 1/22/20.
//  Copyright © 2020 Ian Bailey. All rights reserved.
//

import UIKit
import ImageKit


class ImageCell: UICollectionViewCell {
 
    
    @IBOutlet weak var imageView: UIImageView!
    
    public func configureCell(with image: String) {
        imageView.getImage(with: image) { (result) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            case .failure:
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(systemName: "exclamationmark-triangle")
                }
            }
        }
    }
    
    
    
}
