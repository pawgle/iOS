//
//  UILabel+Extensions.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/29/24.
//

import UIKit

extension UILabel {
    public convenience init(text: String?) {
        self.init()
        self.text = text
    }
    
    public convenience init(text: String, style: UIFont.TextStyle) {
        self.init()
        font = UIFont.preferredFont(forTextStyle: style)
        self.text = text
    }
}
