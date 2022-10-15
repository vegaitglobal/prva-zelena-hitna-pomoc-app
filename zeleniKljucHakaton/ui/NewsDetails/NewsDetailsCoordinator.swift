//
//  NewsDetailsCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class NewsDetailsCoordinator {
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start(newsModel: News) {
        let newsDetailsViewDelegate = NewsDetailsViewModel(coordinator: self,  newsModel: newsModel)
        let newsDetailsViewController = NewsDetailsViewController(viewModel: newsDetailsViewDelegate)
        presenter.pushViewController(newsDetailsViewController, animated: false)
    }
}
