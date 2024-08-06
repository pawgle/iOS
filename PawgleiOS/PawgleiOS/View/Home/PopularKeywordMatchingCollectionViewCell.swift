//
//  PopularKeywordMatchingCollectionViewCell.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/5/24.
//

import UIKit

class PopularKeywordMatchingCollectionViewCell: UICollectionViewCell, ReusableCell {
    
    private var containerView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private var iconLabel: UILabel = {
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
        label.textColor = .orange500
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
        setupIconLabel()
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
    
    private func setupIconLabel() {
        containerView.addArrangedSubview(iconLabel)
        iconLabel.font = .systemFont(ofSize: 28)
        iconLabel.textAlignment = .center
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
        iconLabel.text = "🏠"
        titleLabel.text = "같은 지역"
        subtitleLabel.text = "BEST!"
    }
    
    required init(coder: NSCoder) {
        fatalError("fail to initialize PopularKeywordMatchingCollectionViewCell")
    }
}
