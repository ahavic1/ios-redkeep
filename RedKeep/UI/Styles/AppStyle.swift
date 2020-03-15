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

    var heading1: Style { get }
    var heading2: Style { get }

    var body1: Style { get }
    var body2: Style { get }
}

extension StyleFactoryProtocol {
    func resolveStyle(from string: String?) -> Style? {
        guard let string = string else { return nil }
        let mirror = Mirror(reflecting: self)
        for property in mirror.children where property.label == string {
            return property.value as? Style
        }
        return nil
    }
}

class AppStyles: StyleFactoryProtocol {

    static let shared: AppStyles = AppStyles()

    var primaryButton: Style = Style(
        titleColorNormal: UIColor.primary,
        titleColorDisabled: UIColor.secondaryText,
        textAlignment: NSTextAlignment.center,
        cornerRadius: Dimensions.buttonCornerRadius,
        borderWidth: 1.5,
        borderColor: UIColor.primary
    )

    var secondaryButton: Style = Style()

    var heading1: Style = Style()
    var heading2: Style = Style()

    var body1: Style = Style()
    var body2: Style = Style()

    private init() {}
}
