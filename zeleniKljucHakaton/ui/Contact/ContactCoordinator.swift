//
//  ContactCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//
import UIKit

class ContactCoordinator {
    private let presenter: UINavigationController
    let manager: RepositoryModule
    
    init(presenter: UINavigationController, manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let contactViewDelegate = ContactViewModel(coordinator: self, manager: manager)
        let contactViewController = ContactViewController(viewModel: contactViewDelegate)
        presenter.pushViewController(contactViewController, animated: false)
    }
    
    func createViewController() -> UIViewController {
        let contactViewDelegate = ContactViewModel(coordinator: self, manager: manager)
        let contactViewController = ContactViewController(viewModel: contactViewDelegate)
        return contactViewController
    }
}
