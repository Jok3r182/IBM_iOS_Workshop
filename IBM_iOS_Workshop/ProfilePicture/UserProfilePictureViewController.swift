//
//  ProfilePictureViewController.swift
//  IBM_iOS_Workshop
//
//  Created by Matas Paulius Dregva on 30/07/2024.
//

import Foundation
import UIKit
import IBM_iOS_Workshop_Utils

class UserProfilePictureViewController: UIViewController{
    @IBOutlet weak var imageView: UIImageView!
    
    var url: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    // MARK: - Private methods
    @IBAction func onSubmit(_ sender: Any) {
        selectAndUploadImage()
    }
    
    // MARK: - Actions
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private methods
    private func setupNavigation(){
        self.title = "Profile Picture View"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
}

// MARK: - UIImagePickerControllerDelegate
extension UserProfilePictureViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    private func selectAndUploadImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            UserManager.add(image: image)
            imageView.image = image
        }
    }
}
