//
//  PartnersCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class PartnersCoordinator {
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let partnersViewDelegate = PartnersViewModel(coordinator: self)
        let partnersViewController = PartnersViewController(viewModel: partnersViewDelegate)
        presenter.pushViewController(partnersViewController, animated: false)
    }
}
