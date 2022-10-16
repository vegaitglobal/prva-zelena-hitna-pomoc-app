//
//  NewsViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol NewsViewDelegate {
    var viewDelegate: NewsViewControllerDelegating? { get set }
    var news: [News]? { get set }
    func getNumberOfNews() -> Int
    func getNewsFromDb()
    func continueToNewsDetails(newsModel: News)
}

class NewsViewModel: NewsViewDelegate {
    private var coordinator: NewsCoordinator?
    let requestManager: RepositoryModule
    weak var viewDelegate: NewsViewControllerDelegating?
    var news: [News]? {
        didSet {
            viewDelegate?.reloadData()
        }
    }
    
    init (coordinator: NewsCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
    
    func getNewsFromDb() {
        requestManager.getAllNews()
    }
    
    func getNumberOfNews() -> Int {
        news?.count ?? 0
    }
    
    func continueToNewsDetails(newsModel: News) {
        guard let viewController = viewDelegate as? NewsViewController,
              let navigation = viewController.navigationController else { return }
        coordinator?.continueToNewsDetails(navigation: navigation, newsModel: newsModel)
    }
}

