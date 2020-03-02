//
//  UIViewController.swift
//  RedKeep
//
//  Created by Ademir Havic on 27/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }

    static func instantiateFromStoryboard(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
