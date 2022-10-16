//
//  CategoriesInformationsTableViewCell.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class CategoriesInformationsTableViewCell: UITableViewCell {
    static let identifier = "CategoriesInformationsTableViewCell"
    @IBOutlet weak var cellBackgorund: UIView!
    @IBOutlet weak var button: UIButton!
    var categoryInfoUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellBackgorund.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellSetUp(linkModel: Link) {
        categoryInfoUrl = linkModel.url
        button.setTitle(linkModel.name, for: .normal)
    }
    
    @IBAction func openURL(_ sender: Any) {
        guard let url = categoryInfoUrl else {return}
        if URL(string: url) != nil {
            UIApplication.shared.open(URL(string: url)! as URL)
        }
    }
    
}
