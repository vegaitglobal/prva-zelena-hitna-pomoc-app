//
//  PartnersCollectionViewCell.swift
//  zeleniKljuc
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class PartnersCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    @IBOutlet weak var partnerLogo: CachedImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var boxView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let shadowpath = UIBezierPath(roundedRect: CGRect(x: 5, y: 3,
                                                          width: (boxView.frame.width ), height: boxView.frame.height),
                                      byRoundingCorners:[.topRight, .bottomRight], cornerRadii: CGSize(width: boxView.frame.width, height: 0.1))

        boxView.layer.shadowColor = UIColor.black.cgColor
        boxView.layer.shadowOffset = CGSize(width: 0.1, height: 0.2)
        boxView.layer.shadowOpacity = 0.14
        boxView.layer.shadowRadius = 3
        boxView.layer.masksToBounds =  false
        boxView.layer.shadowPath = shadowpath.cgPath
    }
    
    func cellSetup(partnerModel: Partner) {
        city.text = partnerModel.city
        name.text = partnerModel.name
        guard let imageURL = partnerModel.url else { return }
        partnerLogo.loadImage(imageURL)
    }

}
