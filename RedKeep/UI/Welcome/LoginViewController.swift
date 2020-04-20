//
//  LoginViewController.swift
//  RedKeep
//
//  Created by Ademir Havic on 28/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond

class LoginViewController: BaseViewController<LoginViewModel, WelcomeNavigator> {
    @IBOutlet weak var usernameTextField: PrimaryTextField!
    @IBOutlet weak var passwordTextField: PrimaryTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var linkButtonBottomConstraint: NSLayoutConstraint!

    override func bindViewModel() {
        super.bindViewModel()
    }

    override func keyboardHandler(_ notification: Notification) {
        let keyboardHeight = KeyboardHelper.getKeyboardHeight(from: notification, relativeTo: self.view)
        UIView.animate(withDuration: 0.5) {
            self.linkButtonBottomConstraint.constant = keyboardHeight
            self.view.layoutIfNeeded()
        }
    }
}
