//
//  UIColor.swift
//  RedKeep
//
//  Created by Ademir Havic on 09/03/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

extension UIColor {
    // swiftlint:disable identifier_name
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }

    static func from(image: String) -> UIColor {
        UIColor.init(patternImage: UIImage(named: image) ?? UIImage())
    }

    // - MARK: Base Color Palette

    static var primary: UIColor {
        return UIColor(hexString: "#990000")
    }

    static var primaryDark: UIColor {
        return UIColor(hexString: "#890000")
    }

    static var primaryLight: UIColor {
        return UIColor(hexString: "#EE6161")
    }

    static var mineshaft: UIColor {
        return UIColor(hexString: "#383838")
    }

    static var midGray: UIColor {
        return UIColor(hexString: "#666666")
    }

    static var aluminum: UIColor {
        return UIColor(hexString: "#999999")
    }

    static var green: UIColor {
        return UIColor(hexString: "#428500")
    }

    static var moonstoneBlue: UIColor {
        return UIColor(hexString: "#69A5BE")
    }

    static var errorRed: UIColor {
        return UIColor(hexString: "#E20F00")
    }

    static var white: UIColor {
        return UIColor(hexString: "#FFFFFF")
    }

    static var lilyWhite: UIColor {
        return UIColor(hexString: "#F2F2F2")
    }

    // - MARK: Feature Colors

    static var divider: UIColor = .midGray
}
