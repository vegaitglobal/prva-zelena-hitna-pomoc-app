//
//  DonationsCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class DonationsCoordinator {
    private let presenter: UINavigationController
    let manager: RepositoryModule
    
    init(presenter: UINavigationController, manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let donationsViewDelegate = DonationsViewModel(coordinator: self, manager: manager)
        let donationsViewController = DonationsViewController(viewModel: donationsViewDelegate)
        presenter.pushViewController(donationsViewController, animated: false)
    }
    
    func createViewController() -> UIViewController {
        let donationsViewDelegate = DonationsViewModel(coordinator: self, manager: manager)
        let donationsViewController = DonationsViewController(viewModel: donationsViewDelegate)
        return donationsViewController
    }
}

