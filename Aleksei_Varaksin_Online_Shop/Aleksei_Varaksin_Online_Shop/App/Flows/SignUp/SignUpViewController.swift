//
//  SignUpViewController.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var creditCardTextField: UITextField!
    @IBOutlet var bioTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!

    private let registerService = NetworkServiceFactory().makeRegisterService()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private var selectedGender: String {
        switch self.genderSegmentedControl.selectedSegmentIndex {
        case 0:
            return "Male"
        case 1:
            return "Non-binary"
        case 2:
            return "Female"
        default:
            return "Non-binary"
        }
    }

    @IBAction func signUpButtonPressed(_ sender: Any) {
        if (loginTextField.text != "" && passwordTextField.text != "" && emailTextField.text != "" && creditCardTextField.text != "" && bioTextField.text != "") {
            let userProfileData = UserProfileData(
              userID: 1,
              login: loginTextField.text!,
              password: passwordTextField.text!,
              email: emailTextField.text!,
              gender: selectedGender,
              creditCardNumber: creditCardTextField.text!,
              bio: bioTextField.text!
            )
            registerService.register(data: userProfileData) { [weak self] response in
                self?.performSegue(withIdentifier: "SignupProfileVC", sender: self)
            }
        }
    }

    @IBAction func backToSignInButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SignupSigninVC", sender: self)
    }
}
