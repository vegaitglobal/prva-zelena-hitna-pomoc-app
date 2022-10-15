//
//  SelectCategoryCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class CategoriesCoordinator {
    private let presenter: UINavigationController
    let manager: RepositoryModule
    
    init(presenter: UINavigationController, manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let categoriesViewDelegate = CategoriesViewModel(coordinator: self)
        let categoriesViewController = CategoriesViewController(viewModel: categoriesViewDelegate)
        presenter.pushViewController(categoriesViewController, animated: false)
    }
    
    func goBack() {
        presenter.popViewController(animated: true)
    }
}

