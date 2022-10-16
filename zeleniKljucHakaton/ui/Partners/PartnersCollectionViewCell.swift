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
    var partnerURL: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let shadowpath = UIBezierPath(roundedRect: CGRect(x: -70, y: 3,
                                                          width: (boxView.frame.width - 40), height: boxView.frame.height),
                                      byRoundingCorners:[.topRight, .bottomRight], cornerRadii: CGSize(width: boxView.frame.width, height: 0.1))

        boxView.layer.shadowColor = UIColor.black.cgColor
        boxView.layer.shadowOffset = CGSize(width: -2, height: 5)
        boxView.layer.shadowOpacity = 0.14
        boxView.layer.shadowRadius = 6
        boxView.layer.masksToBounds =  false
        //boxView.layer.shadowPath = shadowpath.cgPath
    }
    
    func cellSetup(partnerModel: Partner) {
        partnerURL = partnerModel.url
        city.text = partnerModel.city
        name.text = partnerModel.name
        guard let imageURL = partnerModel.logo else { return }
        partnerLogo.loadImage(imageURL)
    }

    @IBAction func buttonPressed(_ sender: Any) {
            guard let url = partnerURL else {return}
            if URL(string: url) != nil {
                UIApplication.shared.open(URL(string: url)! as URL)
            }
    }
}
