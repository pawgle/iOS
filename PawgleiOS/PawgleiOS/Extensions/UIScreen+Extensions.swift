//
//  UIScreen+Extensions.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/29/24.
//

import UIKit

extension UIScreen {
    public static var bottomNotchHeight: CGFloat {
        if let window = UIApplication.shared.windows.first {
            return window.safeAreaInsets.bottom
        }
        return 0
    }
}
