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
    var requestManager: RepositoryModule

    init (coordinator: HomeCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
}

