//
//  WasteDisposalViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/16/22.
//

import Foundation

protocol WasteDisposalViewDelegate {
    var screenModel: WasteDisposal? { get set }
    var delegate: WasteDisposalControllerDelegating? { get set }
    func numberOfRows() -> Int
    func getScreenModelFromDb()
}

class WasteDisposalViewModel: WasteDisposalViewDelegate {
    private var coordinator: WasteDisposalCoordinator?
    var requestManager: RepositoryModule
    var delegate: WasteDisposalControllerDelegating?
    var screenModel: WasteDisposal? {
        didSet {
            delegate?.reloadData()
        }
    }
    
    init (coordinator: WasteDisposalCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
    
    func numberOfRows() -> Int {
        screenModel?.locations?.count ?? 0
    }
    
    func getScreenModelFromDb() {
        requestManager.getWaisteDisposalInformations()
    }
}
