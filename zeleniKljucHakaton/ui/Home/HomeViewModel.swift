//
//  HomeViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol HomeViewDelegate {
    var viewDelegate: HomeViewControllerDelegating? { get set }
    func presentImagePicker()
}

final class HomeViewModel: HomeViewDelegate {
    weak var viewDelegate: HomeViewControllerDelegating?
    private let coordinator: HomeCoordinator
    var requestManager: RepositoryModule

    init (coordinator: HomeCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
    
    func presentImagePicker() {
        coordinator.presentImagePicker()
    }
}

extension HomeViewModel: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        // This is when image selected
    }
    
    func didSelect(videoURL: URL?) {
        // Put code here if video is selected
    }
}
