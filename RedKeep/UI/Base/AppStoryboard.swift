//
//  AppStoryboard.swift
//  RedKeep
//
//  Created by Ademir Havic on 27/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    case splash = "LaunchScreen"
    case welcome = "Welcome"

    private var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }

    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardId = (viewControllerClass as UIViewController.Type).storyboardID
        //swiftlint:disable:next force_cast
        return instance.instantiateViewController(withIdentifier: storyboardId) as! T
    }

    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
