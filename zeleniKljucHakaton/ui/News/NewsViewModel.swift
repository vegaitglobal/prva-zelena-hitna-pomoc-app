//
//  NewsViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol NewsViewDelegate {
    var viewDelegate: NewsViewControllerDelegating? { get set }
}

final class NewsViewModel: NewsViewDelegate {
    private var coordinator: NewsCoordinator?
    var viewDelegate: NewsViewControllerDelegating?
    let requestManager: RepositoryModule
    
    init (coordinator: NewsCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
}

