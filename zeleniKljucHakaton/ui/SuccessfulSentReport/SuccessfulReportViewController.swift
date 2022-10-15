//
//  SuccessfulReportViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class SuccessfulReportViewController: UIViewController {
    var viewModel: SuccessfulReportViewDelegate
    
    init(viewModel: SuccessfulReportViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "SuccessfulReportViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

