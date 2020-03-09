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

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton! {
        didSet { loginButton.setStyle(AppStyles.shared.primaryButton) }
    }
    @IBOutlet weak var registerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }

    override func bindViewModel() {
        viewModel.username.bidirectionalBind(to: usernameText.reactive.text)
        viewModel.password.bidirectionalBind(to: passwordText.reactive.text)
        viewModel.loginButtonIsEnabled.bind(to: loginButton.reactive.isEnabled)

        loginButton.reactive.tap.observeNext { [weak self] in
            self?.viewModel.signIn()
        }.dispose(in: bag)

        registerLabel.reactive.tapGesture().observeNext { [weak self] _ in
            self?.viewModel.register()
        }.dispose(in: bag)
    }
}
