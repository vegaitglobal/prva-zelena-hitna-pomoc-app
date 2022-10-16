//
//  HomeViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol HomeViewDelegate {
    var viewDelegate: HomeViewControllerDelegating? { get set }
    var categories: [CategoryModel]? { get set }
    func continueToNews()
    func continueToPartners()
    func continueToDonations()
    func continueToContact()
    func continueToReport()
    func continueToMaps()
    func continueToCategoriesScreen(model: CategoryModel)
    func getNumberOfCategories() -> Int
    func getCategoiresFromDb()
}

class HomeViewModel: HomeViewDelegate {
    weak var viewDelegate: HomeViewControllerDelegating?
    private var coordinator: HomeCoordinator?
    var categories: [CategoryModel]? {
        didSet {
            viewDelegate?.reloadData()
        }
    }
    var requestManager: RepositoryModule
    
    init (coordinator: HomeCoordinator, manager: RepositoryModule) {
        self.coordinator = coordinator
        self.requestManager = manager
    }
    
    func getCategoiresFromDb() {
        requestManager.getAllCategories()
    }
    
    func getNumberOfCategories() -> Int {
        let numberOfCategories = categories?.count ?? 0
        return numberOfCategories
        
    }
    
    func continueToNews(){
        coordinator?.continueToNews()
    }
    
    func continueToPartners(){
        coordinator?.continueToPartners()
    }
    
    func continueToDonations(){
        coordinator?.continueToDonations()
    }
    
    func continueToContact(){
        coordinator?.continueToContact()
    }
    
    func continueToReport() {
        guard let viewController = viewDelegate as? HomeViewController,
              let navigation = viewController.navigationController else { return }
        coordinator?.continueToReport(navigation: navigation)
    }
    
    func continueToMaps() {
        guard let viewController = viewDelegate as? HomeViewController,
              let navigation = viewController.navigationController else { return }
        coordinator?.continueToWasteDisposal(navigation: navigation)
    }
    
    func continueToCategoriesScreen(model: CategoryModel) {
        guard let viewController = viewDelegate as? HomeViewController,
              let navigation = viewController.navigationController else { return }
        coordinator?.continueToCategoriesScreen(navigation: navigation, model: model)
    }
}
