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
    var linkButton: Style { get }

    var hero1: Style { get }
    var hero2: Style { get }
    var heading1: Style { get }
    var heading2: Style { get }
    var heading3: Style { get }

    var body1: Style { get }
    var body2: Style { get }

    var subheader: Style { get }
    var caption1: Style { get }

    var link: Style { get }
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

    static let shared: StyleFactoryProtocol = AppStyles()

    var primaryButton: Style = Style(
        titleColorNormal: .white,
        titleColorDisabled: .aluminum,
        textAlignment: .center,
        cornerRadius: Dimensions.buttonCornerRadius,
        backgroundImageNormal: UIImage.from(color: .primary),
        backgroundImageDisabled: UIImage.from(color: .lilyWhite)
    )

    var secondaryButton: Style = Style()

    var linkButton: Style = Style(
        titleColorNormal: .errorRed,
        titleColorDisabled: .aluminum,
        textAlignment: .center
    )

    var hero1: Style = Style(
        font: .boldSystemFont(ofSize: 36),
        color: .mineshaft,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var hero2: Style = Style(
        font: .systemFont(ofSize: 36),
        color: .mineshaft,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var heading1: Style = Style(
        font: .boldSystemFont(ofSize: 24),
        color: .mineshaft,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var heading2: Style = Style(
        font: .boldSystemFont(ofSize: 20),
        color: .mineshaft,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var heading3: Style = Style(
        font: .boldSystemFont(ofSize: 18),
        color: .mineshaft,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var body1: Style = Style(
        font: .systemFont(ofSize: 16),
        color: .mineshaft,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var body2: Style = Style(
        font: .systemFont(ofSize: 14),
        color: .mineshaft,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var subheader: Style = Style(
        font: .systemFont(ofSize: 14),
        color: .midGray,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var caption1: Style = Style(
        font: .systemFont(ofSize: 12),
        color: .mineshaft,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    var link: Style = Style(
        font: .systemFont(ofSize: 14),
        color: .errorRed,
        textAlignment: .left,
        numberOfLines: 0,
        lineBreakMode: .byTruncatingTail
    )

    private init() {}
}
