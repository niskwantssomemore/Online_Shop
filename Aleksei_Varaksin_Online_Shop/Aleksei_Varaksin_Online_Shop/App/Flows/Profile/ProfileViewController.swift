//
//  ProfileViewController.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 16.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var creditCardTextField: UITextField!
    @IBOutlet var bioTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!

    private let changeUserDataService = NetworkServiceFactory().makeChangeUserDataService()
    private let logoutService = NetworkServiceFactory().makeLogoutService()

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

    @IBAction func saveChangesButtonPressed(_ sender: Any) {
        if (loginTextField.text != "" && passwordTextField.text != "" && emailTextField.text != "" && creditCardTextField.text != "" && bioTextField.text != "") {
        let newUserProfileData = UserProfileData(
          userID: 1,
          login: loginTextField.text!,
          password: passwordTextField.text!,
          email: emailTextField.text!,
          gender: selectedGender,
          creditCardNumber: creditCardTextField.text!,
          bio: bioTextField.text!
        )
            changeUserDataService.changeUserProfile(data: newUserProfileData) { [weak self] response in
                self?.showUserProfileWasChangedAlert()
            }
        }
    }

    @IBAction func shopButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "ProfileShopVC", sender: self)
    }

    @IBAction func basketButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "ProfileBasketVC", sender: self)
    }

    @IBAction func signOutButtonPressed(_ sender: Any) {
        logoutService.logout(userID: 1) { [weak self] response in
            self?.performSegue(withIdentifier: "ProfileSigninVC", sender: self)
        }
    }

    private func showUserProfileWasChangedAlert() {
      let alertController = UIAlertController(title: "Success",
                                              message: "Your data has been changed successfully",
                                              preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] action in
        self?.navigationController?.popViewController(animated: true)
      }
      alertController.addAction(okAction)
      present(alertController, animated: true, completion: nil)
    }
}
