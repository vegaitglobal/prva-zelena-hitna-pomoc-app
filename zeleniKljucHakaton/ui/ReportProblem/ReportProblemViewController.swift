//
//  ReportProblemViewController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import UIKit

class ReportViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    var viewModel: ReportViewDelegate
    @IBOutlet weak var scrollView: UIScrollView!
    let categoryNames = ["Voda", "Vazduh", "Šume", "Otpad", "Buka", "Gradnja", "Drugo"]
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var checkbox: UIButton!
    @IBOutlet weak var anonimusReportButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    var isAnonymusChecked: Bool = false
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var categoryButton: UIButton!
    static let myNotification = Notification.Name("startGame")
 
    
    @objc func onNotification(notification: Notification)
    {
        let selectedCategory = notification.object ?? "izaberi kategoriju"
        categoryButton.setTitle(selectedCategory as! String, for: .normal)
        
    }
    
    init(viewModel: ReportViewDelegate) {
        self.viewModel = viewModel
        super.init(nibName: "ReportProblemViewController", bundle: nil)
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
        locationTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func handleImageSelectTap(_ sender: Any) {
        viewModel.presentImagePicker()
    }
    
    @IBAction func categoryButtonPressed(_ sender: Any) {
        viewModel.continueToCategories()
    }
    
    @IBAction func chooseLocation(_ sender: Any) {
//        viewModel.continueToMaps()
    }
    
    @IBAction func reportProblem(_ sender: Any) {
        viewModel.continueToSuccesfulReport()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: ReportViewController.myNotification, object: nil)
    }
    
    func didReceiveData(data: Any) {
        DispatchQueue.main.sync {
//
               }
    }
    
    
    @IBAction func anonymusReportButtonPressed(_ sender: Any) {
        isAnonymusChecked = !isAnonymusChecked
        (sender as AnyObject).setImage(UIImage(systemName: isAnonymusChecked ? "square" : "checkmark.square" ), for: .normal)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.textView.text = nil
        if self.textView.textColor == UIColor.lightGray {
            self.textView.text = nil
            self.textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.textView.text.isEmpty {
            self.textView.text = "Opis"
            self.textView.textColor = UIColor.lightGray
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

extension ReportViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
                               info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
//        viewModel.imageCollection.append(info[.editedImage] as! UIImage)
//        self.reloadData()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

