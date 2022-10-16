//
//  GalleryCell.swift
//  zeleniKljucHakaton
//
//  Created by Milan Djordjevic on 16/10/2022.
//

import UIKit

final class GalleryCell: UICollectionViewCell {
    @IBOutlet weak var picture: UIImageView!
    static let identifier = "GalleryCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        picture.layer.cornerRadius = 6
        picture.clipsToBounds = true
    }
    
    func setup(with image: UIImage) {
        picture.image = image
    }

}
