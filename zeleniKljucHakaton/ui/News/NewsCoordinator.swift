//
//  NewsCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class NewsCoordinator {
    private let presenter: UINavigationController
    let manager: RepositoryModule
    
    init(presenter: UINavigationController, manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let newsViewModel = NewsViewModel(coordinator: self, manager: manager)
        let newsViewController = NewsViewController(viewModel:  newsViewModel)
        presenter.pushViewController(newsViewController, animated: false)
    }
    
    func createViewController() -> UIViewController {
        let newsViewModel = NewsViewModel(coordinator: self, manager: manager)
        let newsViewController = NewsViewController(viewModel:  newsViewModel)
        return newsViewController
    }
    
    func continueToNewsDetails(navigation: UINavigationController, newsModel: News) {
        let newsDetailsCoordinator = NewsDetailsCoordinator(presenter: navigation)
        newsDetailsCoordinator.start(newsModel: newsModel)
    }
}
