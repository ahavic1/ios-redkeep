//
//  UIView.swift
//  RedKeep
//
//  Created by Ademir Havic on 09/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

extension UIView: Styleable {
    //swiftlint:disable valid_ibinspectable
    @IBInspectable var style: String? {
        get { return nil }
        set {
            if let resolvedStyle = AppStyles.shared.resolveStyle(from: newValue) {
                self.setStyle(resolvedStyle)
            }
        }
    }

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
    func localize() {
        switch self {
        case let label as UILabel:
            if let text = label.text { label.text = text.localized }
        case let button as UIButton:
            if let text = button.titleLabel?.text { button.setTitle(text.localized, for: .normal) }
        case let textField as UITextField:
            if let placeholder = textField.placeholder { textField.placeholder = placeholder.localized }
        default:
            break
        }
    }

    func setCommonProperties(_ style: Style) {
        if let alpha = style.alpha { self.alpha = alpha }
        if let tintColor = style.tintColor { self.tintColor = tintColor }
        if let cornerRadius = style.cornerRadius { self.layer.cornerRadius = cornerRadius }
        if let borderWidth = style.borderWidth { self.layer.borderWidth = borderWidth }
        if let borderColor = style.borderColor { self.layer.borderColor = borderColor }
    }

    func setViewSpecificProperties(_ style: Style) {
        switch self {
        case let button as UIButton:
            setProperties(for: button, style: style)
        case let label as UILabel:
            setProperties(for: label, style: style)
        case let textField as UITextField:
            setProperties(for: textField, style: style)
        default:
            break
        }
    }

    func setProperties(for button: UIButton, style: Style) {
        if let font = style.font { button.titleLabel?.font = font }
        if let textAlignment = style.textAlignment { button.titleLabel?.textAlignment = textAlignment }
        if let bgImage = style.backgroundImageNormal { button.setBackgroundImage(bgImage, for: .normal) }
        if let bgImage = style.backgroundImageDisabled { button.setBackgroundImage(bgImage, for: .disabled) }
        if let titleColor = style.titleColorNormal { button.setTitleColor(titleColor, for: .normal) }
        if let titleColor = style.titleColorDisabled { button.setTitleColor(titleColor, for: .disabled) }
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
