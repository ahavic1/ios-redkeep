//
//  Style.swift
//  RedKeep
//
//  Created by Ademir Havic on 11/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

protocol Styleable {
    func setStyle(_ style: Style)
}

struct Style {
    var font: UIFont?
    var color: UIColor?
    var titleColorNormal: UIColor?
    var titleColorDisabled: UIColor?
    var textAlignment: NSTextAlignment?
    var numberOfLines: Int?
    var lineBreakMode: NSLineBreakMode?
    var highlightedTextColor: UIColor?
    var attributedString: NSAttributedString?
    var buttonTitleShadowColor: UIColor?
    var buttonImage: UIImage?
    var cornerRadius: CGFloat?
    var backgroundColor: UIColor?
    var backgroundImageNormal: UIImage?
    var backgroundImageDisabled: UIImage?
    var alpha: CGFloat?
    var tintColor: UIColor?
    var borderWidth: CGFloat?
    var borderColor: CGColor?
    var opacity: Float?
    var shadowColor: CGColor?
    var shadowOpacity: Float?
    var shadowOffset: CGSize?
    var shadowRadius: CGFloat?

    init(
        font: UIFont? = nil,
        color: UIColor? = nil,
        titleColorNormal: UIColor? = nil,
        titleColorDisabled: UIColor? = nil,
        textAlignment: NSTextAlignment? = nil,
        numberOfLines: Int? = nil,
        lineBreakMode: NSLineBreakMode? = nil,
        highlightedTextColor: UIColor? = nil,
        attributedString: NSAttributedString? = nil,
        buttonTitleShadowColor: UIColor? = nil,
        buttonImage: UIImage? = nil,
        cornerRadius: CGFloat? = nil,
        backgroundColor: UIColor? = nil,
        backgroundImageNormal: UIImage? = nil,
        backgroundImageDisabled: UIImage? = nil,
        alpha: CGFloat? = nil,
        tintColor: UIColor? = nil,
        borderWidth: CGFloat? = nil,
        borderColor: UIColor? = nil,
        opacity: Float? = nil,
        shadowColor: CGColor? = nil,
        shadowOpacity: Float? = nil,
        shadowOffset: CGSize? = nil,
        shadowRadius: CGFloat? = nil
    ) {
        self.font = font
        self.color = color
        self.titleColorNormal = titleColorNormal
        self.titleColorDisabled = titleColorDisabled
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
        self.highlightedTextColor = highlightedTextColor
        self.attributedString = attributedString
        self.buttonTitleShadowColor = buttonTitleShadowColor
        self.buttonImage = buttonImage
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.backgroundImageNormal = backgroundImageNormal
        self.backgroundImageDisabled = backgroundImageDisabled
        self.alpha = alpha
        self.tintColor = tintColor
        self.borderWidth = borderWidth
        self.borderColor = borderColor?.cgColor
        self.opacity = opacity
        self.shadowColor = shadowColor
        self.shadowOpacity = shadowOpacity
        self.shadowOffset = shadowOffset
        self.shadowRadius = shadowRadius
    }
}
