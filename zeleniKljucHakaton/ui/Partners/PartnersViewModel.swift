//
//  PartnersViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol PartnersViewDelegate {
    var partnerScreenInfos: PartnersScreenModel? { get set }
}

class PartnersViewModel: PartnersViewDelegate {
    private var coordinator: PartnersCoordinator?
    var partnerScreenInfos: PartnersScreenModel?
    
    init (coordinator: PartnersCoordinator) {
        self.coordinator = coordinator
    }
}
