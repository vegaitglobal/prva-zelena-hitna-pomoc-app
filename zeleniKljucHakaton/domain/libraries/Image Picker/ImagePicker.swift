//
//  ImagePicker.swift
//  zeleniKljucHakaton
//
//  Created by Milan Djordjevic on 15/10/2022.
//

import UIKit

public protocol ImagePickerDelegate: AnyObject {
    func didSelect(image: UIImage?)
    func didSelect(videoURL: URL?)
}

final class ImagePicker: NSObject {
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?
    
    init(presentationController: UIViewController,
         delegate: ImagePickerDelegate,
         mediaTypes: [String] = ["public.image"]) {
        self.pickerController = UIImagePickerController()
        super.init()
        self.presentationController = presentationController
        self.delegate = delegate
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = false
    }
    
    func present() {
        guard let presentationController = presentationController else { return }
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if let action = self.action(for: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = presentationController.view
            alertController.popoverPresentationController?.sourceRect = presentationController.view.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        
        presentationController.present(alertController, animated: true)
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else { return nil }
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            if let availableCamera = UIImagePickerController.availableMediaTypes(for: .camera) {
                self.pickerController.mediaTypes = availableCamera
            }
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    
    private func didSelectImage(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        delegate?.didSelect(image: image)
    }
    
    private func didSelectVideo(_ controller: UIImagePickerController, didSelect url: URL?) {
        controller.dismiss(animated: true, completion: nil)
        delegate?.didSelect(videoURL: url)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        didSelectImage(picker, didSelect: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let videoURL = info[.mediaURL] as? URL {
            return didSelectVideo(picker, didSelect: videoURL)
        }
        
        if !picker.isEditing {
            guard let image = info[.originalImage] as? UIImage else {
                return didSelectImage(picker, didSelect: nil)
            }
            didSelectImage(picker, didSelect: image)
        }
        
        guard let image = info[.editedImage] as? UIImage else {
            return didSelectImage(picker, didSelect: nil)
        }
        
        didSelectImage(picker, didSelect: image)
    }
}

extension ImagePicker: UINavigationControllerDelegate {
}
