//
//  CustomModalView.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/3/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CustomModalView: UIView {
    
    private let dimmingView = UIView()
    var isVisibleRelay: BehaviorRelay<Bool>
    var contentView: UIView
    var contentViewSize: CGSize
    var shouldDismissOnBackgroundTap: Bool
    
    private let disposeBag = DisposeBag()
    
    init(
        contentView: UIView,
        contentViewSize: CGSize,
        isVisibleRelay: BehaviorRelay<Bool>,
        shouldDismissOnBackgroundTap: Bool = false
    ) {
        self.contentView = contentView
        self.isVisibleRelay = isVisibleRelay
        self.contentViewSize = contentViewSize
        self.shouldDismissOnBackgroundTap = shouldDismissOnBackgroundTap
        super.init(frame: .zero)
        setupDimmingView()
        setupContentView()
        bindViews()
    }
    
    private func setupDimmingView() {
        addSubview(dimmingView)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        dimmingView.frame = UIScreen.main.bounds
                
        if shouldDismissOnBackgroundTap {
            let tapGesture = UITapGestureRecognizer()
            tapGesture.addTarget(self, action: #selector(hideModal))
            tapGesture.delegate = self
            dimmingView.addGestureRecognizer(tapGesture)
        }
    }
    
    private func setupContentView() {
        dimmingView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(contentViewSize.width)
            make.height.equalTo(contentViewSize.height)
        }
    }
    
    private func bindViews() {
        isVisibleRelay.bind { [weak self] isVisible in
            guard let self = self else { return }
            self.isUserInteractionEnabled = isVisible
            self.dimmingView.isHidden = !isVisible
            self.contentView.isHidden = !isVisible
        }
        .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func hideModal() {
        isVisibleRelay.accept(false)
    }
}

extension CustomModalView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if contentView.frame.contains(touch.location(in: dimmingView)) {
            return false
        }
        return true
    }
}
