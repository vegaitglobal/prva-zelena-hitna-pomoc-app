//
//  PartnersViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol PartnersViewDelegate {
    var partnerScreenInfos: PartnersScreenModel? { get set }
    var delegate: PartnersDelegating? { get set }
    func numberOfCells() -> Int
    func getPartnersDetails()
}

class PartnersViewModel: PartnersViewDelegate {
    private var coordinator: PartnersCoordinator?
    var requestManager: RepositoryModule
    var delegate: PartnersDelegating?
    var partnerScreenInfos: PartnersScreenModel? {
        didSet {
            delegate?.reloadData()
        }
    }
    
    init (coordinator: PartnersCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
    
    func numberOfCells() -> Int {
        partnerScreenInfos?.listOfPartners.count ?? 0
    }
    
    func getPartnersDetails() {
        requestManager.getPartnerDetails()
    }
}
