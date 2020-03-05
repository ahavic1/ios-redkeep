//
//  LoginViewController.swift
//  RedKeep
//
//  Created by Ademir Havic on 28/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController<LoginViewModel, WelcomeNavigator> {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func bindViewModel() {
        
    }
}
