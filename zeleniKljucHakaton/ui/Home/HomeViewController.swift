//
//  HomeViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol HomeViewControllerDelegating: AnyObject {
}

class HomeViewController: UIViewController, UITabBarControllerDelegate, UITabBarDelegate, HomeViewControllerDelegating {
    var viewModel: HomeViewDelegate
    
    init(viewModel: HomeViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
        self.viewModel.viewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
