//
//  ProfilePictureViewController.swift
//  IBM_iOS_Workshop
//
//  Created by Matas Paulius Dregva on 30/07/2024.
//

import Foundation
import UIKit

class UserProfilePictureViewController: UIViewController{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData: [String: URL] = [:]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupPicker()
    }
    
    // MARK: - Private methods
    @IBAction func onSubmit(_ sender: Any) {
        //set picture on submit
    }
    
    // MARK: - Actions
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private methods
    private func setupPicker(){
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        pickerData = [
            "Halo": URL(string: "https://wpassets.halowaypoint.com/wp-content/2021/10/Autumnarchives_thumbnail-2.jpg")!,
            "Batman": URL(string: "https://static.dc.com/dc/files/default_images/Char_Profile_Batman_20190116_5c3fc4b40faec2.47318964.jpg")!
        ]
    }
    
    private func setupNavigation(){
        self.title = "Profile Picture View"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        task.resume()
    }
}

// MARK: - UIPickerViewDelegate
extension UserProfilePictureViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(pickerData.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedKey = Array(pickerData.keys)[row]
        if let selectedURL = pickerData[selectedKey] {
            loadImage(from: selectedURL)
        }
    }
}
