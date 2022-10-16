//
//  GalleryViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Milan Djordjevic on 16/10/2022.
//

import UIKit

protocol GalleryViewModeling {
    var viewDelegate: GalleryViewControllerDelegationg? { get set }
    func numberOfRows() -> Int
}

final class GalleryViewModel: GalleryViewModeling {
    weak var viewDelegate: GalleryViewControllerDelegationg?
    private let coordinator: GalleryCoordinating
    var images = [UIImage]()
    
    init(coordinator: GalleryCoordinating) {
        self.coordinator = coordinator
    }
    
    func numberOfRows() -> Int {
        images.count
    }
}
