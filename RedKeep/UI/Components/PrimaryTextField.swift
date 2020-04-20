//
//  RedKeepTextField.swift
//  RedKeep
//
//  Created by Ademir Havic on 06/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

@IBDesignable
class PrimaryTextField: UITextField {
    // - MARK: Inspectable properties
    @IBInspectable var leftIcon: UIImage? {
        didSet { addLeftIcon() }
    }

    @IBInspectable var maximumNumberOfCharacters: Int = 255
    @IBInspectable var topInset: CGFloat = 12
    @IBInspectable var leftInset: CGFloat = 0
    @IBInspectable var bottomInset: CGFloat = 0
    @IBInspectable var rightInset: CGFloat = 0

    // - MARK: Constants
    private var underlineDefaultHeight: CGFloat = 1

    // - MARK: Private properties
    private enum ViewState {
        case normal
        case focused
        case editing
    }

    private var viewState: ViewState! {
        didSet { setupView(for: viewState) }
    }

    private var normalColor: UIColor = .midGray
    private var focusedColor: UIColor = .moonstoneBlue
    private var leftIconView: UIImageView?
    private lazy var underlineView: UIView = makeUnderline()
    private var underlineViewHeightAnchor: NSLayoutConstraint!

    private var padding: UIEdgeInsets {
        return UIEdgeInsets(
            top: topInset,
            left: leftInset + (leftIconView?.frame.width ?? 0) + 2,
            bottom: bottomInset,
            right: rightInset
        )
    }

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

private extension PrimaryTextField {
    func commonInit() {
        setupUI()
        setControlEvents()
    }

    func setupUI() {
        borderStyle = .none
        font = .systemFont(ofSize: 16)
        addUnderline()
        addLeftIcon()
        viewState = .normal
    }

    func setControlEvents() {
        reactive.controlEvents(.editingDidBegin).observeNext {
            self.viewState = .editing
        }.dispose(in: bag)

        reactive.controlEvents(.editingDidEnd).observeNext {
            self.viewState = .normal
        }.dispose(in: bag)
    }

    func addUnderline() {
        addSubview(underlineView)
        underlineViewHeightAnchor = underlineView.heightAnchor.constraint(
            equalToConstant: underlineDefaultHeight
        )
        NSLayoutConstraint.activate([
            underlineView.leftAnchor.constraint(equalTo: leftAnchor),
            underlineView.rightAnchor.constraint(equalTo: rightAnchor),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            underlineViewHeightAnchor
        ])
    }

    func addLeftIcon() {
        guard leftIcon != nil else { return }
        leftIconView?.removeFromSuperview()
        leftIconView = UIImageView(image: leftIcon, tintColor: normalColor)
        guard let leftIconView = self.leftIconView else { return }

        addSubview(leftIconView)
        NSLayoutConstraint.activate([
            leftIconView.topAnchor.constraint(equalTo: topAnchor, constant: topInset + 8),
            leftIconView.leftAnchor.constraint(equalTo: leftAnchor),
            leftIconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    private func setupView(for state: ViewState) {
        switch state {
        case .normal:
            underlineViewHeightAnchor?.constant = underlineDefaultHeight
            setTintColor(to: normalColor)
        case .editing, .focused:
            underlineViewHeightAnchor?.constant = underlineDefaultHeight + 0.5
            setTintColor(to: focusedColor)
        }
    }

    func makeUnderline() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = normalColor
        return view
    }

    func setTintColor(to color: UIColor) {
        tintColor = color
        underlineView.backgroundColor = color
        leftIconView?.tintColor = color
    }
}
