//
//  RedKeepTextField.swift
//  RedKeep
//
//  Created by Ademir Havic on 06/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class CustomTextField: JVFloatLabeledTextField {
    // - MARK: Private properties
    private var underlineView: UIView!
    private var padding: UIEdgeInsets {
        return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    }
    // - MARK: Inspectable properties
    @IBInspectable var underlineNormalColor: UIColor = UIColor.divider {
        didSet { underlineView.backgroundColor = underlineNormalColor }
    }
    @IBInspectable var underlineSelectedColor: UIColor = UIColor.primary
    @IBInspectable var maximumNumberOfCharacters: Int = 255
    @IBInspectable var topInset: CGFloat = 8
    @IBInspectable var leftInset: CGFloat = 0
    @IBInspectable var bottomInset: CGFloat = 0
    @IBInspectable var rightInset: CGFloat = 0

    // - MARK: Property overrides
    override var text: String? {
        didSet {
            if let text = text, text.count > maximumNumberOfCharacters {
                self.text = String(text.prefix(maximumNumberOfCharacters))
            }
        }
    }

    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        underlineView.backgroundColor = underlineNormalColor
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var leftViewRect = super.leftViewRect(forBounds: bounds)
        leftViewRect.origin.y -= bottomInset
        return leftViewRect
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightViewRect = super.rightViewRect(forBounds: bounds)
        rightViewRect.origin.y -= bottomInset
        return rightViewRect
    }
}

private extension CustomTextField {
    func commonInit() {
        addUnderline()
        setControlEvents()
    }

    func setControlEvents() {
        reactive.controlEvents(.editingDidBegin).observeNext {
            self.underlineView.backgroundColor = self.underlineSelectedColor
        }.dispose(in: bag)

        reactive.controlEvents(.editingDidEnd).observeNext {
            self.underlineView.backgroundColor = self.underlineNormalColor
        }.dispose(in: bag)
    }

    func addUnderline() {
        underlineView = UIView()
        underlineView.backgroundColor = underlineNormalColor
        addSubview(underlineView)
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underlineView.leftAnchor.constraint(equalTo: self.leftAnchor),
            underlineView.rightAnchor.constraint(equalTo: self.rightAnchor),
            underlineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
