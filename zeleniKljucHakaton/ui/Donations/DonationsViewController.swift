//
//  DonationsViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

final class DonationsViewController: UIViewController {
    var viewModel: DonationsViewDelegate
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var donationsDescription: UILabel!
    
    init(viewModel: DonationsViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "DonationsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getDonationsInformations()
        NotificationCenter.default.addObserver(self, selector: #selector(getDonationsInformations), name: Notification.Name.donations, object: nil)
    }
    
    @objc func getDonationsInformations(notification: NSNotification) {
        let donationsInfo = notification.object as? DonationsScreenModel
        cardNumber.text = donationsInfo?.cardNumber ?? ""
        donationsDescription.text = donationsInfo?.description ?? ""

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}
