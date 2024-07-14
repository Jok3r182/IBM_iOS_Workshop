//
//  ViewController.swift
//  IBM_iOS_Workshop
//
//  Created by Matas Paulius Drėgva on 10/04/2024.
//

import UIKit
import IBM_iOS_Workshop_Utils

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLogin(_ sender: Any) {
        UserManager.createUser(username: usernameTextField.text ?? "")
        usernameTextField.text = ""
    }
    
}

