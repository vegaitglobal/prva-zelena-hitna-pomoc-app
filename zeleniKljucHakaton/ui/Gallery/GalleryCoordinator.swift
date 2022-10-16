//
//  GalleryCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Milan Djordjevic on 16/10/2022.
//

import UIKit

protocol GalleryCoordinating: Coordinating {
}

final class GalleryCoordinator: GalleryCoordinating {
    private weak var presenter: UINavigationController?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let viewModel = GalleryViewModel(coordinator: self)
        let viewController = GalleryViewController(viewModel: viewModel)
        presenter?.present(viewController, animated: true)
    }
    
    func createViewController() -> UIViewController {
        let viewDelegate = GalleryViewModel(coordinator: self)
        let viewController = GalleryViewController(viewModel: viewDelegate)
        return viewController
    }
}
