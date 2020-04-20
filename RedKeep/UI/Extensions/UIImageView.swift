//
//  UIImage.swift
//  RedKeep
//
//  Created by Ademir Havic on 20/04/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, tintColor: UIColor) {
        let renderImage = image?.withRenderingMode(.alwaysTemplate)
        self.init(image: renderImage)
        self.tintColor = tintColor
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
