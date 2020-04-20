//
//  LaunchNavigator.swift
//  RedKeep
//
//  Created by Ademir Havic on 20/04/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

class AppNavigator: Navigator {
    var navigationController: UINavigationController?

    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func navigate(to destination: Destination) {
    }
}

enum LaunchDestination: Destination {
    case launch
    case login
}

class LaunchNavigator: AppNavigator {
    override func navigate(to destination: Destination) {
        //swiftlint:disable:next force_cast
        let viewController = createViewController(for: destination as! LaunchDestination)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func createViewController(for destination: LaunchDestination) -> UIViewController {
        switch destination {
        case .launch:
            let launchVC = LaunchViewController.instantiateFromStoryboard(appStoryboard: .splash)
            launchVC.viewModel = LaunchViewModel()
            return launchVC
        case .login:
            let loginvc = LoginViewController.instantiateFromStoryboard(appStoryboard: .welcome)
            loginvc.viewModel = LoginViewModel()
            return loginvc
        }
    }
}
