//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by Shashi Kiran Kuppili on 5/9/19.
//  Copyright © 2019 Shashi Kiran Kuppili. All rights reserved.
//

import UIKit
import Photos


class AddTripViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving : (() -> ())?
    
    var tripIndexToEdit : Int?
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 45)
        tripTextField.frame.size = CGSize(width: 350 , height: 40)
        imageView.layer.cornerRadius = 10
        
        titleLabel.layer.shadowColor = UIColor.red.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowRadius = 5
        
        if let index = tripIndexToEdit{
            let data = Data.tripModels[index]
            tripTextField.text = data.title
            imageView.image = data.image
            titleLabel.text = "Edit Trip"
        }
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
        //        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                self.presentPhotoLibrary()
                
            case .notDetermined:
                if status == PHAuthorizationStatus.authorized {
                    self.presentPhotoLibrary()
                }
                
            case .restricted:
                DispatchQueue.main.async {
                    let alert = Alert.createAlert(title: "Restricted access", message: "Photo Library access is restricted", preferredStyle: .alert, actionButton: .init(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
            case .denied:
                DispatchQueue.main.async {
                    let alert =  Alert.createAlert(title: "Denied access", message: "Photo Library access is denied", preferredStyle: .alert, actionButton: .init(title: "Go to settings", style: .default, handler: { (action) in
                        let url = URL(string: UIApplication.openSettingsURLString)!
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            @unknown default:
                break
            }
        }
        //        }
    }
    
    fileprivate func presentPhotoLibrary() {
        let photoPicker = UIImagePickerController()
        photoPicker.allowsEditing = true
        photoPicker.sourceType = .photoLibrary
        photoPicker.delegate = self
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func save(_ sender: Any) {
        
        guard tripTextField.text != "", let tripAdded = tripTextField.text else {
            let iV = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            iV.image = UIImage(named: "error")
            iV.contentMode = .scaleAspectFill
            tripTextField.rightViewMode = .always
            tripTextField.rightView = iV
            tripTextField.layer.borderColor = UIColor.red.cgColor
            tripTextField.layer.borderWidth = 1
            tripTextField.layer.cornerRadius = 5
            tripTextField.placeholder = "Trip name required"
            return
        }
        
        if let indexExists = tripIndexToEdit {
            TripFunctions.updateTrips(at: indexExists, title: tripAdded, image: imageView.image)
        }else {
            TripFunctions.createTrip(tripModel: TripModel(title: tripAdded, image :imageView.image))
        }
        
        if let callBack = doneSaving {
            callBack()
        }
        dismiss(animated: true, completion: nil)
    }
}


extension AddTripViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {   // for image croping
            self.imageView.image = image
        }
        else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
