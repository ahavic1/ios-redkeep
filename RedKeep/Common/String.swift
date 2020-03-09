//
//  String.swift
//  RedKeep
//
//  Created by Ademir Havic on 09/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import Foundation

extension String {
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }

    public var localized: String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: Bundle.main,
            value: self,
            comment: ""
        )
    }
}
