//
//  LoginViewModel.swift
//  RedKeep
//
//  Created by Ademir Havic on 28/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import Foundation
import ReactiveKit

class LoginViewModel: BaseViewModel {
    private let loginRepository: LoginRepository

    let username = Property<String?>("")
    let password = Property<String?>("")
    let loginButtonIsEnabled = Property<Bool>(false)

    init(loginRepository: LoginRepository = LoginRepositoryImpl()) {
        self.loginRepository = loginRepository
        super.init()
        setupValidation()
    }

    func signIn() {
        loginRepository.login(with: username.value!, password: password.value!) { _, error in
            if error != nil {
                // errorHandler
                return
            }
            // save token and navigat to main screen
        }
    }

    func register() {
        // navigate to registration
    }
}

private extension LoginViewModel {
    func setupValidation() {
        combineLatest(username, password).observeNext { username, password in
            if let username = username, let password = password {
                self.loginButtonIsEnabled.value = username.isNotEmpty && password.isNotEmpty
            } else {
                self.loginButtonIsEnabled.value = false
            }
        }.dispose(in: bag)
    }
}
