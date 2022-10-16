//
//  SelectCategoryViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import Foundation

protocol CategoriesViewDelegate {
    var viewDelegate: CategoriesViewDelegating? { get set }
    var categories: [CategoryModel]? { get set }
    func goBack()
    func numberOfRows() -> Int
    func getCategoriesFromDb()
}

class CategoriesViewModel: CategoriesViewDelegate {
    private var coordinator: CategoriesCoordinator?
    var requestManager: RepositoryModule
    var viewDelegate: CategoriesViewDelegating?
    var categories: [CategoryModel]? {
        didSet {
            viewDelegate?.reloadData()
        }
    }
    
    init (coordinator: CategoriesCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
    
    func goBack() {
        coordinator?.goBack()
    }
    
    func getCategoriesFromDb() {
        requestManager.getAllCategories()
    }
    
    func numberOfRows() -> Int {
        categories?.count ?? 0
    }
}
