//
//  ReportViewModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import CoreLocation
import UIKit

protocol ReportViewDelegate {
    var selectedCategory: String { get set }
    var images: [UIImage] { get set }
    var viewDelegate: ReportViewControllerDelegating? { get set }
    func continueToCategories()
    func presentImagePicker()
    func showError(with message: String)
    func submitReport(with model: ProblemReportModel)
}

final class ReportViewModel: NSObject, ReportViewDelegate {
    weak var viewDelegate: ReportViewControllerDelegating?
    private var coordinator: ReportCoordinator?
    private var locationManager:CLLocationManager!
    private var requestManager: RepositoryModule!
    var selectedCategory: String = ""
    var images = [UIImage]()
    
    init (coordinator: ReportCoordinator, manager: RepositoryModule) {
        super.init()
        self.coordinator = coordinator
        self.requestManager = manager
        self.initLocation()
    }
    
    func continueToCategories() {
        coordinator?.continueToCategories()
    }
    
    func submitReport(with model: ProblemReportModel) {
        requestManager.createProblemReport(problem: model)
        coordinator?.continueToSuccesfulReport()
    }

    func presentImagePicker() {
        coordinator?.presentImagePicker()
    }
    
    func showError(with message: String) {
        coordinator?.showError(with: message)
    }
    
    func initLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
}

extension ReportViewModel: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let image = image else { return }
        images.append(image)
        viewDelegate?.updateImages()
    }
    
    func didSelect(videoURL: URL?) {
        // Put code here if video is selected
    }
}

// MARK: Location delegate
extension ReportViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("not determined - hence ask for Permission")
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("permission denied")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            print("Error")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { [weak self] (placemarks, error) in
            guard let placemarks = placemarks,
                  let self = self else { return }
            if (error != nil) {
                print("error in reverseGeocode")
            }
            
            if placemarks.count > 0 {
                let placemark = placemarks[0]
                self.viewDelegate?.updateLocation(with: "\(placemark.name ?? ""), \(placemark.locality ?? "") \(placemark.country ?? "")")
                self.locationManager.stopUpdatingLocation()
            }
        }

    }
}
