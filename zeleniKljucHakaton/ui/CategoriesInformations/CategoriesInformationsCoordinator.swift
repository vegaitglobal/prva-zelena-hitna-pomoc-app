//
//  CategoriesInformationsCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class CategoriesInformationsCoordinator {
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start(model: CategoryModel) {
        let categoriesInformationsViewDelegate = CategoriesInformationsViewModel(coordinator: self, model: model)
        let categoriesInformationsViewController = CategoriesInformationsViewController(viewModel: categoriesInformationsViewDelegate)
        presenter.pushViewController(categoriesInformationsViewController, animated: false)
    }
}
