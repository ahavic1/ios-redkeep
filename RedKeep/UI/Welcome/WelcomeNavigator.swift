//
//  LoginNavigator.swift
//  RedKeep
//
//  Created by Ademir Havic on 03/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

enum WelcomeDestination: Destination {
    case login
    case registration
    case homescreen
}

class WelcomeNavigator: Navigator {
    weak var navigationController: UINavigationController?

    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func navigate(to destination: Destination) {
        let vc = createViewContoller(for: destination as! WelcomeDestination)
        print(type(of: vc))
    }

    private func createViewContoller(for destination: WelcomeDestination) -> UIViewController {
        switch destination {
        case .login:
            return UIViewController()
        case .registration:
            return UIViewController()
        case .homescreen:
            return UIViewController()
        }
    }
}