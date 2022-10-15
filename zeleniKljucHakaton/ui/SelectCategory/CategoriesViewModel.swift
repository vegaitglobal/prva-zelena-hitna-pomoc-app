//
//  SelectCategoryViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import Foundation

protocol CategoriesViewDelegate {
    func goBack()
}

class CategoriesViewModel: CategoriesViewDelegate {
    private var coordinator: CategoriesCoordinator?
    
    init (coordinator: CategoriesCoordinator) {
        self.coordinator = coordinator
    }
    
    func goBack() {
        coordinator?.goBack()
    }
}
