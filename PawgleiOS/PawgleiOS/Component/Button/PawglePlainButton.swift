//
//  PawglePlainButton.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/5/24.
//

import UIKit

class PawglePlainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .gray100
        self.setTitleColor(.gray600, for: .normal)
        self.titleLabel?.font = R.font.pretendardMedium(size: 12)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    required init(coder: NSCoder) {
        fatalError("fail to initialze PawglePlainButton")
    }
}
