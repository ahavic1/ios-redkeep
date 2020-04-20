//
//  KeyboardHelper.swift
//  RedKeep
//
//  Created by Ademir Havic on 07/05/2020.
//  Copyright © 2020 Ademir Havic. All rights reserved.
//

import UIKit

class KeyboardHelper {
    static func getKeyboardHeight(from notification: Notification, relativeTo view: UIView) -> CGFloat {
        let userInfo = notification.userInfo!
        //swiftlint:disable:next force_cast
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        return view.convert(keyboardFrame, to: nil).size.height
    }
}
