//
//  ContactViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class ContactViewController: UIViewController {
    var viewModel: ContactViewDelegate
    
    init(viewModel: ContactViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "ContactViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
