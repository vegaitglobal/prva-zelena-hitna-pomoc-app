//
//  ReportViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

protocol ReportViewDelegate {
//    func continueToCategories()
//    func continueToSuccesfulReport()
//    func continueToMaps()
    func presentImagePicker()
}

class ReportViewModel: ReportViewDelegate {
    private var coordinator: ReportCoordinator?
    
    init (coordinator: ReportCoordinator) {
        self.coordinator = coordinator
    }
    
//    func continueToCategories() {
//        coordinator?.continueToCategories()
//    }
//
//    func continueToSuccesfulReport() {
//        coordinator?.continueToSuccesfulReport()
//    }
//
//    func continueToMaps() {
//        coordinator?.continueToMaps()
//    }
    func presentImagePicker() {
        coordinator?.presentImagePicker()
    }
}

extension ReportViewModel: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        // This is when image selected
    }
    
    func didSelect(videoURL: URL?) {
        // Put code here if video is selected
    }
}

