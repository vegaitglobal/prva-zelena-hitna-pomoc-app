//
//  DonationsViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

protocol DonationsViewDelegate {
}

class DonationsViewModel: DonationsViewDelegate {
    private var coordinator: DonationsCoordinator?
    var requestManager: RepositoryModule
    
    init (coordinator: DonationsCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
}
