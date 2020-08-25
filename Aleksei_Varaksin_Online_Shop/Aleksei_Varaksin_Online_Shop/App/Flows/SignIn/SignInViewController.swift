//
//  SignInViewController.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    private let authService = NetworkServiceFactory().makeAuthService()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInButtonPressed(_ sender: Any) {
        if (loginTextField.text != "" && passwordTextField.text != "") {
            let login = loginTextField.text!
            let password = passwordTextField.text!
            authService.login(login: login, password: password) { [weak self] response in
                self?.performSegue(withIdentifier: "SigninProfileVC", sender: self)
            }
        }
    }

    @IBAction func signUpButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SigninSignupVC", sender: self)
    }
}
