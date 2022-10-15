//
//  ReportViewCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

protocol ReportCoordinating: Coordinating {
    func presentImagePicker()
}

class ReportCoordinator {
    private let presenter: UINavigationController
    let manager: RepositoryModule
    private var imagePicker: ImagePicker?
    
    init(presenter: UINavigationController,  manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let reportViewDelegate = ReportViewModel(coordinator: self)
        let reportViewController = ReportViewController(viewModel: reportViewDelegate)
        presenter.pushViewController(reportViewController, animated: false)
        imagePicker = ImagePicker(presentationController: reportViewController,
                                  delegate: reportViewDelegate,
                                  mediaTypes: ["public.image"])
    }
    
    func presentImagePicker() {
        guard let imagePicker = imagePicker else { return }
        imagePicker.present()
    }
    
    func continueToCategories() {
        let categoriesCoordinator = CategoriesCoordinator(presenter: presenter, manager: manager)
        categoriesCoordinator.start()
    }

    func continueToSuccesfulReport() {
        let succesfulReportCoordinator = SuccessfulReportCoordinator(presenter: presenter)
        succesfulReportCoordinator.start()
    }

    func continueToMaps() {
//        let mapsCoordinator = MapsCoordinator(presenter: presenter)
//        mapsCoordinator.continueToMapScheme()
    }
}


