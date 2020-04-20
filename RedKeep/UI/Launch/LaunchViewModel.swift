//
//  LaunchViewModel.swift
//  RedKeep
//
//  Created by Ademir Havic on 20/04/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import Foundation

class LaunchViewModel: BaseViewModel {

    override func viewWillAppear() {
        super.viewWillAppear()
        DispatchQueue.asyncAfter(delay: 1) {
            self.navigate(to: LaunchDestination.login)
        }
    }
}
