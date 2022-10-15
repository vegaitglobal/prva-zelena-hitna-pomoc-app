//
//  CategoriesInformationsViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//
import Foundation

protocol CategoriesInformationsViewDelegate {
    var model: CategoryModel { get set }
    func numberOfRows() -> Int
}

class CategoriesInformationsViewModel: CategoriesInformationsViewDelegate {
    private var coordinator: CategoriesInformationsCoordinator?
    var model: CategoryModel
    
    init (coordinator: CategoriesInformationsCoordinator, model: CategoryModel) {
        self.coordinator = coordinator
        self.model = model
    }
    
    func numberOfRows() -> Int {
        model.subcategories?.count ?? 0
    }
}
