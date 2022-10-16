//
//  SuccessfulReportCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class SuccessfulReportCoordinator: Coordinating {
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let successfulReportViewDelegate = SuccessfulReportViewModel(coordinator: self)
        let successfulReportViewController = SuccessfulReportViewController(viewModel: successfulReportViewDelegate)
        presenter.pushViewController(successfulReportViewController, animated: false)
    }
    
    func stop() {
        presenter.dismiss(animated: true)
    }
}

