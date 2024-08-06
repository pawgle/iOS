//
//  UIViewController+Modal.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/5/24.
//

import UIKit
import RxSwift
import RxCocoa

extension UIViewController {
    
    func presentCustomModal(
        contentView: UIView,
        size: CGSize,
        isVisibleRelay: BehaviorRelay<Bool>,
        shouldDismissOnBackgroundTap: Bool = false
    ) {
        let modalView = CustomModalView(
            contentView: contentView,
            contentViewSize: size,
            isVisibleRelay: isVisibleRelay,
            shouldDismissOnBackgroundTap: shouldDismissOnBackgroundTap
        )
        
        view.addSubview(modalView)
        modalView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        isVisibleRelay.accept(true)
    }
}
