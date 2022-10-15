//
//  DonationsViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class DonationsViewController: UIViewController {
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
    }
}
