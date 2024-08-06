//
//  UIColletionView+Extensions.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/7/24.
//

import UIKit

extension UICollectionView {
    
    func register<Cell: UICollectionViewCell>(_ cellType: Cell.Type) {
        let className = String(describing: cellType)
        self.register(cellType, forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(for cellType: Cell.Type, at indexPath: IndexPath) -> Cell {
        let className = String(describing: cellType)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? Cell else {
            fatalError("Error for cell id: \(className) at \(indexPath))")
        }
        return cell
    }
}
