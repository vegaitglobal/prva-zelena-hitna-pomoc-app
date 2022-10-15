//
//  PartnersCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class PartnersCoordinator {
    private let presenter: UINavigationController
    let manager: RepositoryModule
    
    init(presenter: UINavigationController, manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let partnersViewDelegate = PartnersViewModel(coordinator: self)
        let partnersViewController = PartnersViewController(viewModel: partnersViewDelegate)
        presenter.pushViewController(partnersViewController, animated: false)
    }
    
    func createViewController() -> UIViewController {
        let partnersViewDelegate = PartnersViewModel(coordinator: self)
        let partnersViewController = PartnersViewController(viewModel: partnersViewDelegate)
        return partnersViewController
    }
}
