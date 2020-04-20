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
        bindViewModel()
        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
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

    func hideNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
}
