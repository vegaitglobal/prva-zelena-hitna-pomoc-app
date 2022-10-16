//
//  SelectCategoryViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import Foundation

protocol CategoriesViewDelegate {
    var categories: [CategoryModel]? { get set }
    func goBack()
    func numberOfRows() -> Int
}

class CategoriesViewModel: CategoriesViewDelegate {
    private var coordinator: CategoriesCoordinator?
    var categories: [CategoryModel]?
    
    init (coordinator: CategoriesCoordinator) {
        self.coordinator = coordinator
    }
    
    func goBack() {
        coordinator?.goBack()
    }
    
    func numberOfRows() -> Int {
        categories?.count ?? 0
    }
}
