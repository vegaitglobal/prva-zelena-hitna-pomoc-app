//
//  CategoryTableViewCell.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    static let identifier = "CategoryTableViewCell"
    @IBOutlet weak var categoryItem: UILabel!
    @IBOutlet weak var logoImage: CachedImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func cellSetup(category: CategoryModel) {
        categoryItem.text = category.name
        guard let logoURL = category.image else { return }
        logoImage.loadImage(logoURL)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
