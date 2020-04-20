//
//  UIImage.swift
//  RedKeep
//
//  Created by Ademir Havic on 07/05/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

extension UIImage {
    static func from(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
