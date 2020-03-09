//
//  UIView.swift
//  RedKeep
//
//  Created by Ademir Havic on 09/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

extension UIView: Styleable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
    }

    func setStyle(_ style: Style) {
        setCommonProperties(style)
        setViewSpecificProperties(style)
    }
}

private extension UIView {
    //swiftlint:disable force_cast
    func localize() {
        switch self {
        case is UILabel:
            let label = (self as! UILabel)
            if let text = label.text {
                label.text = text.localized
            }
        case is UIButton:
            let button = (self as! UIButton)
            if let text = button.titleLabel?.text {
                button.setTitle(text.localized, for: .normal)
            }
        case is UITextField:
            let textField = (self as! UITextField)
            if let placeholder = textField.placeholder {
                textField.placeholder = placeholder.localized
            }
        default:
            break
        }
    }

    func setCommonProperties(_ style: Style) {
        if let isHidden = style.isHidden { self.isHidden = isHidden }
        if let alpha = style.alpha { self.alpha = alpha }
        if let tintColor = style.tintColor { self.tintColor = tintColor }
    }

    func setViewSpecificProperties(_ style: Style) {
        switch self {
        case is UIButton:
            setProperties(for: self as! UIButton, style: style)
        case is UILabel:
            setProperties(for: self as! UILabel, style: style)
        case is UITextField:
            setProperties(for: self as! UITextField, style: style)
        default:
            break
        }
    }

    func setProperties(for button: UIButton, style: Style) {
        if let font = style.font { button.titleLabel?.font = font }
        if let textAlignment = style.textAlignment { button.titleLabel?.textAlignment = textAlignment }
        if let cornerRadius = style.cornerRadius { button.layer.cornerRadius = cornerRadius }
        if let bgImage = style.backgroundImageNormal { button.setImage(bgImage, for: .normal) }
        if let bgImage = style.backgroundImageDisabled { button.setImage(bgImage, for: .disabled) }
        if let titleColor = style.titleColorNormal { button.setTitleColor(titleColor, for: .normal) }
        if let titleColor = style.titleColorDisabled { button.setTitleColor(titleColor, for: .disabled) }
        if let borderWidth = style.borderWidth { button.layer.borderWidth = borderWidth }
        if let borderColor = style.borderColor { button.layer.borderColor = borderColor }
    }

    func setProperties(for label: UILabel, style: Style) {
        if let font = style.font { label.font = font }
        if let color = style.color { label.textColor = color}
        if let textAlignment = style.textAlignment { label.textAlignment = textAlignment }
        if let lineBreakMode = style.lineBreakMode { label.lineBreakMode = lineBreakMode }
        if let highlightedColor = style.highlightedTextColor { label.highlightedTextColor = highlightedColor }
        if let numberOfLines = style.numberOfLines { label.numberOfLines = numberOfLines }
    }

    func setProperties(for textField: UITextField, style: Style) {
        if let font = style.font { textField.font = font }
        if let color = style.color { textField.textColor = color}
        if let textAlignment = style.textAlignment { textField.textAlignment = textAlignment }
    }
}
