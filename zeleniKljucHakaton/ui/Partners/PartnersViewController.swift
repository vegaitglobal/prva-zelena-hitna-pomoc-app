//
//  PartnersViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class PartnersViewController: UIViewController {
    var viewModel: PartnersViewDelegate
    
    init(viewModel: PartnersViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "PartnersViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}
