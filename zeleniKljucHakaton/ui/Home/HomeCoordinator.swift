//
//  HomeCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol HomeCoordinating: Coordinating {
    func presentImagePicker()
}

final class HomeCoordinator: HomeCoordinating {
    private let presenter: UINavigationController
    private var imagePicker: ImagePicker?
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
    
    func presentImagePicker() {
        guard let imagePicker = imagePicker else { return }
        imagePicker.present()
    }
    
    func createViewController() -> UIViewController {
        let homeViewModel = HomeViewModel(coordinator: self, manager: manager)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        imagePicker = ImagePicker(presentationController: homeViewController,
                                  delegate: homeViewModel,
                                  mediaTypes: ["public.image"])
        return homeViewController
    }
}
