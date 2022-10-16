//
//  HomeCollectionViewCell.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    @IBOutlet weak var categoryIcon: CachedImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func cellSetUp(categoryInfo: CategoryModel) {
        categoryName.text = categoryInfo.name
        if let imageUrl = categoryInfo.image {
            categoryIcon.loadImage(imageUrl)
        }
    }
}

