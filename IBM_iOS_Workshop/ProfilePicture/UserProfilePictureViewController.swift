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
        UserManager.add(imageUrl: url)
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
    
    private func isValidURL(_ urlString: String) -> Bool {
        let urlRegex = "^(https?://)?([\\w.-]+)?([\\w\\.-]+\\.[a-zA-Z]{2,6})(:[0-9]{1,5})?(/.*)?$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", urlRegex)
        return predicate.evaluate(with: urlString)
    }
}

// MARK: - UISearchBarDelegate
extension UserProfilePictureViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if isValidURL(searchText){
            loadImage(from: URL(string: searchText)!)
        }
    }
}
