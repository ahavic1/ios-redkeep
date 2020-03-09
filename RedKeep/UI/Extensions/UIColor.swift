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

    static var primary: UIColor {
        return UIColor(hexString: "#3F51B5")
    }

    static var primaryDark: UIColor {
        return UIColor(hexString: "#303F9F")
    }

    static var primaryLight: UIColor {
        return UIColor(hexString: "#C5CAE9")
    }

    static var primaryAccent: UIColor {
        return UIColor(hexString: "#607D8B")
    }

    static var primaryText: UIColor {
        return UIColor(hexString: "#212121")
    }

    static var secondaryText: UIColor {
        return UIColor(hexString: "#757575")
    }

    static var divider: UIColor {
        return UIColor(hexString: "#BDBDBD")
    }
}
