//
//  SqaureMatchCollectionViewCell.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/5/24.
//

import UIKit
import SnapKit

class PetchingCollectionViewCell: UICollectionViewCell, ReusableCell {
    
    private var containerView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private var petLabelView: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var labelView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.pretendardSemiBold(size: 14)
        label.textColor = .gray800
        label.textAlignment = .center
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.pretendardMedium(size: 12)
        label.textColor = .gray400
        label.textAlignment = .center
        return label
    }()
    
    private var buttonView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var matchButton: PawglePlainButton = {
        let button = PawglePlainButton(title: "매칭 하기")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContainerView()
        setupPetLabelView()
        setupLabelView()
        setupMatchButton()
    }
    
    private func setupContainerView() {
        contentView.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    private func setupPetLabelView() {
        containerView.addArrangedSubview(petLabelView)
        petLabelView.font = .systemFont(ofSize: 28)
        petLabelView.textAlignment = .center
    }
    
    private func setupLabelView() {
        containerView.addArrangedSubview(labelView)
        labelView.addSubview(titleLabel)
        labelView.addSubview(subtitleLabel)
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
    }
    
    private func setupMatchButton() {
        containerView.addArrangedSubview(buttonView)
        buttonView.addSubview(matchButton)
        matchButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    // TODO: API 연동 결과에 따른 뷰 프로퍼티 세팅
    func configure() {
        petLabelView.text = "🐶"
        titleLabel.text = "댕댕이 집사 만나기"
        subtitleLabel.text = "댕집사 이성 만나기"
    }
    
    required init(coder: NSCoder) {
        fatalError("fail to initialize PetchingCollectionViewCell")
    }
}
