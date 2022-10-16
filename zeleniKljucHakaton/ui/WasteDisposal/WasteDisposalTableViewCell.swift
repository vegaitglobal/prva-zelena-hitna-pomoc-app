//
//  WasteDisposalTableViewCell.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/16/22.
//

import UIKit

class WasteDisposalTableViewCell: UITableViewCell {
    static let identifier = "WasteDisposalTableViewCell"
    @IBOutlet weak var button: UIButton!
    var wasteDisposalUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellSetUp(model: WasteDisposalLocation) {
        wasteDisposalUrl = model.url
        button.setTitle(model.name, for: .normal)
    }
    
    @IBAction func openURL(_ sender: Any) {
        guard let url = wasteDisposalUrl else {return}
        if URL(string: url) != nil {
            UIApplication.shared.open(URL(string: url)! as URL)
        }
    }
    
}
