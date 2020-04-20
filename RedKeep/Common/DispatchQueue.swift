//
//  DispatchQueue.swift
//  RedKeep
//
//  Created by Ademir Havic on 20/04/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static func asyncAfter(delay: TimeInterval, block: @escaping () -> Void) {
        main.asyncAfter(deadline: .now() + delay, execute: block)
    }
}
