//
//  ViewController.swift
//  IBM_iOS_Workshop
//
//  Created by Matas Paulius Drėgva on 10/04/2024.
//

import UIKit
import IBM_iOS_Workshop_Utils

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
    }
  
    // MARK: - IBActions
    @IBAction func onLogin(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserManager.createUser(username: usernameTextField.text!)
        usernameTextField.text = ""
        openProfilePictureViewController()
    }
    
    // MARK: - Private methods
    private func openProfilePictureViewController(){
        let storyboard = UIStoryboard(name: StoryboardIdentifier.userProfileStoryboard.rawValue, bundle: nil)
        if let profilePictureVC = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifier.userProfileViewController.rawValue) as? UserProfilePictureViewController {
            let navigationController = UINavigationController(rootViewController: profilePictureVC)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }
    
    private func isValidUsername(_ username: String) -> Bool {
        let allowedCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-"
        
        let minLength = 5
        let maxLength = 15
        if username.count < minLength || username.count > maxLength {
            return false
        }
        
        for character in username {
            if !allowedCharacters.contains(character) {
                return false
            }
        }
        
        return true
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        loginButton.isEnabled = isValidUsername(textField.text ?? "")
        return true
    }
}

