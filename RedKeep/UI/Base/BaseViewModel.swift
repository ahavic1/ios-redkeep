//
//  BaseViewModel.swift
//  RedKeep
//
//  Created by Ademir Havic on 28/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import Foundation
import ReactiveKit

class BaseViewModel {

    let navigationEvent = Property<Destination?>(nil)

    func viewDidLoad() {}

    func viewWillAppear() {}

    func viewWillDisappear() {}
}
