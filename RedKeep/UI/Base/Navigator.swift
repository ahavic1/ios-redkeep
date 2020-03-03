//
//  AppNavigator.swift
//  RedKeep
//
//  Created by Ademir Havic on 27/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//
import UIKit

protocol Navigator {
    var navigationController: UINavigationController? { get set }

    init(navigationController: UINavigationController?)

    func navigate(to destination: Destination)
}

protocol Destination { }
