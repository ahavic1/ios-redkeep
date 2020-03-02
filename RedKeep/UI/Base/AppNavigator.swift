//
//  AppNavigator.swift
//  RedKeep
//
//  Created by Ademir Havic on 27/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//
import UIKit

protocol NavigationProtocol {
    var navigationController: UINavigationController? { get set }
}

class AppNavigator: NavigationProtocol {
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func goToSplash() {

    }

    func goToLogin() {

    }

    func goToRegistration() {

    }
}
