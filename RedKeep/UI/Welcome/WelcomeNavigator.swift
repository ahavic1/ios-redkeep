//
//  LoginNavigator.swift
//  RedKeep
//
//  Created by Ademir Havic on 03/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

enum WelcomeDestination: Destination {
    case registration
    case homescreen
}

class WelcomeNavigator: AppNavigator {
    override func navigate(to destination: Destination) {
        //swiftlint:disable:next force_cast
        let viewController = createViewContoller(for: destination as! WelcomeDestination)
        navigationController?.pushViewController(viewController, animated: true)
    }

    private func createViewContoller(for destination: WelcomeDestination) -> UIViewController {
        switch destination {
        case .registration:
            return UIViewController()
        case .homescreen:
            return UIViewController()
        }
    }
}
