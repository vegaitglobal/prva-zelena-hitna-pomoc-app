//
//  ReportViewCoordinator.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

protocol ReportCoordinating: Coordinating {
    func presentImagePicker()
    func showError(with message: String, title: String)
}

final class ReportCoordinator {
    private let presenter: UINavigationController
    private let manager: RepositoryModule
    private var imagePicker: ImagePicker?
    
    init(presenter: UINavigationController,  manager: RepositoryModule) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func start() {
        let reportViewDelegate = ReportViewModel(coordinator: self, manager: manager)
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
    
    func showError(with message: String, title: String = "Greška") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            print("Action")
        }))
        presenter.present(alert, animated: true)
    }
}
