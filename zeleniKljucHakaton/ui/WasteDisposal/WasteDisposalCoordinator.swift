//
//  WasteDisposalCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/16/22.
//

import UIKit

class WasteDisposalCoordinator {
    private let presenter: UINavigationController
    private var manager: RepositoryModule
    
    init(presenter: UINavigationController, manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let wasteDisposalViewDelegate = WasteDisposalViewModel(coordinator: self, manager: manager)
        let wasteDisposalViewController = WasteDisposalViewController(viewModel: wasteDisposalViewDelegate)
        presenter.pushViewController(wasteDisposalViewController, animated: false)
    }
}
