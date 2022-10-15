//
//  HomeViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol HomeViewDelegate {
    var viewDelegate: HomeViewControllerDelegating? { get set }
}

class HomeViewModel: HomeViewDelegate {
    weak var viewDelegate: HomeViewControllerDelegating?
    private var coordinator: HomeCoordinator?

    init (coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}

