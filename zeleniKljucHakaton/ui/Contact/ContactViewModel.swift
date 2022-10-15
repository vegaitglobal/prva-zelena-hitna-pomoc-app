//
//  ContactViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

protocol ContactViewDelegate {
    func getContactInformationsFromDb()
}

class ContactViewModel: ContactViewDelegate {
    private var coordinator: ContactCoordinator?
    var requestManager: RepositoryModule
    
    init (coordinator: ContactCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
    
    func getContactInformationsFromDb() {
        requestManager.getContactInformations()
    }
}
