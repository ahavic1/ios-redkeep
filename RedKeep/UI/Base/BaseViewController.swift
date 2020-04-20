//
//  BaseViewController.swift
//  RedKeep
//
//  Created by Ademir Havic on 28/02/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit
import ReactiveKit

class BaseViewController<ViewModelType: BaseViewModel, NavigatorType: Navigator>: UIViewController {

    lazy private var navigator: Navigator = NavigatorType(navigationController: self.navigationController)

    var viewModel: ViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        bindViewModel()
        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
        setKeyboardObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }

    open func bindViewModel() {
        viewModel.navigationEvent.observeNext { [weak self] destination in
            guard let self = self, let destination = destination else { return }
            self.navigator.navigate(to: destination)
        }.dispose(in: bag)
    }

    open func keyboardHandler(_ notification: Notification) {}

    final func adjustForKeyboard(notification: Notification, scrollView: UIScrollView) {
        let userInfo = notification.userInfo
         // swiftlint:disable:next force_cast
        let keyboardFrame = (userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardHeight = self.view.convert(keyboardFrame, to: nil).size.height

        var contentInsets = scrollView.contentInset
        contentInsets.bottom = keyboardHeight
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}

// MARK: ViewController Navigation
extension BaseViewController {
    func hideNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: Private methods
private extension BaseViewController {
    private func setKeyboardObserver() {
        merge(
            NotificationCenter.default.reactive.notification(name: UIResponder.keyboardWillHideNotification),
            NotificationCenter.default.reactive.notification(name: UIResponder.keyboardWillShowNotification)
        )
            .receive(on: DispatchQueue.main)
            .observeNext { [weak self] notification in
                self?.keyboardHandler(notification)
            }.dispose(in: bag)
    }
}
