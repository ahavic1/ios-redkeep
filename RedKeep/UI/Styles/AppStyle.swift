//
//  AppStyle.swift
//  RedKeep
//
//  Created by Ademir Havic on 11/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

protocol StyleFactoryProtocol {
    var primaryButton: Style { get }
    var secondaryButton: Style { get }
}

class AppStyles: StyleFactoryProtocol {

    static let shared: AppStyles = AppStyles()

    public var primaryButton: Style = {
        return Style(
            titleColorNormal: UIColor.primary,
            titleColorDisabled: UIColor.secondaryText,
            textAlignment: NSTextAlignment.center,
            cornerRadius: Dimensions.buttonCornerRadius,
            borderWidth: 1.5,
            borderColor: UIColor.primary
        )
    }()

    var secondaryButton: Style = {
        return Style()
    }()

    private init() {}
}
