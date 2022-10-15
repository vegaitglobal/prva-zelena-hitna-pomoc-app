//
//  HomeCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class HomeCoordinator {
    private let presenter: UINavigationController
    let manager: RepositoryModule
    
    init(presenter: UINavigationController, manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let homeViewModel = HomeViewModel(coordinator: self, manager: manager)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        presenter.pushViewController(homeViewController, animated: false)
    }
    
    func createViewController() -> UIViewController {
        let homeViewModel = HomeViewModel(coordinator: self, manager: manager)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        return homeViewController
    }
}
