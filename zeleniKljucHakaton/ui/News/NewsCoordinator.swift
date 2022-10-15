//
//  NewsCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class NewsCoordinator {
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let newsViewModel = NewsViewModel(coordinator: self)
        let newsViewController = NewsViewController(viewModel:  newsViewModel)
        presenter.pushViewController(newsViewController, animated: false)
    }
}
