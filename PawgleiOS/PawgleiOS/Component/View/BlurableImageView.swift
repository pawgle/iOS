//
//  BlurableImageView.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/5/24.
//

import UIKit

class BlurableImageView: UIImageView {
    private var visualEffectView: UIVisualEffectView?
    
    var blur: Bool = false {
        didSet {
            updateBlurEffect()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        setupBlurEffect()
    }
    
    private func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .dark)
        visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView?.frame = bounds
        visualEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        visualEffectView?.isHidden = true
        addSubview(visualEffectView!)
    }
    
    private func updateBlurEffect() {
        visualEffectView?.isHidden = !blur
    }
}
