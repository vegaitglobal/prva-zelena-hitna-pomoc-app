//
//  GalleryViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Milan Djordjevic on 16/10/2022.
//

import Foundation

protocol GalleryViewModeling {
    var viewDelegate: GalleryViewControllerDelegationg? { get set }
}

final class GalleryViewModel: GalleryViewModeling {
    weak var viewDelegate: GalleryViewControllerDelegationg?
    private let coordinator: GalleryCoordinating
    
    init(coordinator: GalleryCoordinating) {
        self.coordinator = coordinator
    }
}
