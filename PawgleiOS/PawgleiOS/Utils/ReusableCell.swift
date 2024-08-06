//
//  ReusableCell.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/7/24.
//

import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
