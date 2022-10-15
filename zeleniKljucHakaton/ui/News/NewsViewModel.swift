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

class NewsViewModel: NewsViewDelegate {
    private var coordinator: NewsCoordinator?
    
    init (coordinator: NewsCoordinator) {
        self.coordinator = coordinator
    }
}

