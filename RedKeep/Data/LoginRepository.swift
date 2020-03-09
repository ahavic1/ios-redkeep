//
//  LoginRepository.swift
//  RedKeep
//
//  Created by Ademir Havic on 05/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import Foundation

typealias LoginCallback = (Any?, Error?) -> Void

protocol LoginRepository {
    func login(with username: String, password: String, callback: @escaping LoginCallback)
    func logout(callback: @escaping LoginCallback)
}

class LoginRepositoryImpl: LoginRepository {
    func login(with username: String, password: String, callback: @escaping LoginCallback) {

    }

    func logout(callback: @escaping LoginCallback) {

    }
}
