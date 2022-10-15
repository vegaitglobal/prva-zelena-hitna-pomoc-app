//
//  NewsViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit
protocol NewsViewControllerDelegating: AnyObject {
}

class NewsViewController: UIViewController {
    var viewModel: NewsViewDelegate
    
    init(viewModel: NewsViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "NewsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
    }
}
