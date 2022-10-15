//
//  HomeCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

class HomeCoordinator {
    private let presenter: UINavigationController
    let manager: RepositoryModule
    
    init(presenter: UINavigationController, manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let homeViewModel = HomeViewModel(coordinator: self, manager: manager)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        presenter.pushViewController(homeViewController, animated: false)
    }
    
    func createViewController() -> UIViewController {
        let homeViewModel = HomeViewModel(coordinator: self, manager: manager)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        return homeViewController
    }
    
    func continueToNews() {
        let newsCoordinator = NewsCoordinator(presenter: presenter, manager: manager)
        newsCoordinator.start()
    }
    
    func continueToPartners() {
        let partnersCoordinator = PartnersCoordinator(presenter: presenter, manager: manager)
        partnersCoordinator.start()
    }
    
    func continueToDonations() {
        let donationsCoordinator = DonationsCoordinator(presenter: presenter, manager: manager)
        donationsCoordinator.start()
    }
    
    func continueToContact() {
        let contactCoordinator = ContactCoordinator(presenter: presenter, manager: manager)
        contactCoordinator.start()
    }
    
    func continueToReport(navigation: UINavigationController) {
        let reportCoordinator = ReportCoordinator(presenter: navigation, manager: manager)
        reportCoordinator.start()
    }
    
    func continueToMaps(navigation: UINavigationController) {
//        let mapsCoordinator = MapsCoordinator(presenter: navigation)
//        mapsCoordinator.start()
    }
    
    func continueToCategoriesScreen(navigation: UINavigationController, model: CategoryModel) {
//        let categoriesInformationsCoordinator = CategoriesInformationsCoordinator(presenter: navigation)
//        categoriesInformationsCoordinator.start(model: model)
    }
}
