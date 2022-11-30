//
//  ReportProblemViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//
import Foundation
import CoreGraphics
import UIKit

protocol ReportViewControllerDelegating: AnyObject {
    func updateLocation(with address: String)
    func updateImages()
}

final class ReportViewController: UIViewController, ReportViewControllerDelegating, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var galleryView: UIView!
    
    let categoryNames = ["Voda", "Vazduh", "Šume", "Otpad", "Buka", "Gradnja", "Drugo"]
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var checkbox: UIButton!
    @IBOutlet weak var anonimusReportButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    var isAnonymusChecked = false
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var categoryButton: UIButton!
    static let myNotification = Notification.Name("startGame")
    var viewModel: ReportViewDelegate
    var galleryController: GalleryViewController!
    
    init(viewModel: ReportViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "ReportProblemViewController", bundle: nil)
        self.viewModel.viewDelegate = self
    }
    
    @objc
    func onNotification(notification: Notification) {
        let selectedCategory = notification.object ?? "izaberi kategoriju"
        categoryButton.setTitle(selectedCategory as? String, for: .normal)
        
        guard let category = notification.object as? String else { return }
        viewModel.selectedCategory = category
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkbox.setImage(UIImage(systemName: "square"), for: .normal)
        textView.delegate = self
        textView.text = "Opis"
        textView.textColor = UIColor.lightGray
        scrollView.delegate = self
        nameTextField.delegate = self
        nameTextField.attributedPlaceholder = .init(string: "Ime i prezime", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        locationTextField.delegate = self
        locationTextField.attributedPlaceholder = .init(string: "Lokacija problema koji prijavljujete", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if let galleryController = GalleryCoordinator(presenter: navigationController!).createViewController() as? GalleryViewController {
            self.galleryController = galleryController
            galleryController.images = viewModel.images
            addToview(to: galleryView, child: galleryController)
        }
    }
    
    func updateImages() {
        galleryController.images = viewModel.images
    }
    
    @IBAction func handleImageSelectTap(_ sender: Any) {
        viewModel.presentImagePicker()
    }
    
    @IBAction func categoryButtonPressed(_ sender: Any) {
        viewModel.continueToCategories()
    }
    
    @IBAction func reportProblem(_ sender: Any) {
        guard let name = nameTextField.text,
              let address = locationTextField.text,
              let description = textView.text,
              !address.isEmpty,
              !description.isEmpty,
              !viewModel.selectedCategory.isEmpty else {
            viewModel.showError(with: "Opis i kategorija su obavezna polja.")
            return
        }
        
        let model = ProblemReportModel(userName: isAnonymusChecked ? "" : name,
                                       location: address,
                                       category: viewModel.selectedCategory,
                                       description: textView.text,
                                       imagesURL: [])
        viewModel.submitReport(with: model)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: ReportViewController.myNotification, object: nil)
    }
    
    @IBAction func anonymusReportButtonPressed(_ sender: Any) {
        isAnonymusChecked.toggle()
        (sender as AnyObject).setImage(UIImage(systemName: isAnonymusChecked ? "square" : "checkmark.square" ), for: .normal)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.textView.text = nil
        if self.textView.textColor == UIColor.lightGray {
            self.textView.text = nil
            self.textView.textColor = UIColor.black
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 3
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func updateLocation(with address: String) {
        locationTextField.text = address
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension ReportViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
}
