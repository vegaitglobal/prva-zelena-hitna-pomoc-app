//
//  PartnersViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol PartnersViewDelegate {
}

class PartnersViewModel: PartnersViewDelegate {
    private var coordinator: PartnersCoordinator?
    
    init (coordinator: PartnersCoordinator) {
        self.coordinator = coordinator
    }
}
