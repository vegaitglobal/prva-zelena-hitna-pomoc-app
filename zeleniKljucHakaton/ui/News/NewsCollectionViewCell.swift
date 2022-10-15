//
//  NewsCollectionViewCell.swift
//  zeleniKljuc
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: CachedImageView!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func cellSetup(model: News) {
        newsTitle.text = model.title
        newsDescription.text = model.description
        newsDate.text = model.date
        guard let imageURL = model.image else { return }
        newsImage.loadImage(imageURL)
    }

}
