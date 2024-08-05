//
//  PersonalizedKeywordMatchingCollectionViewCell.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/5/24.
//

import UIKit

class PersonalizedKeywordMatchingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PersonalizedKeywordMatchingCollectionViewCell"
    
    private var iconLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        return label
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.pretendardSemiBold(size: 14)
        label.textColor = .gray800
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.pretendardMedium(size: 12)
        label.textColor = .orange500
        return label
    }()
    
    private var matchButton: PawglePlainButton = {
        let button = PawglePlainButton(title: "매칭 하기")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        setupIconLabel()
        setupTitleLabel()
        setupSubtitleLabel()
        setupMatchButton()
    }
    
    private func setupContentView() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true
    }
    
    private func setupIconLabel() {
        contentView.addSubview(iconLabel)
        iconLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconLabel.snp.trailing).offset(12)
        }
    }
    
    private func setupSubtitleLabel() {
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(8)
        }
    }
    
    private func setupMatchButton() {
        contentView.addSubview(matchButton)
        matchButton.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(16)
            make.width.equalTo(92)
        }
    }
    
    // TODO: API 연동 결과에 따른 뷰 프로퍼티 세팅
    func configure() {
        iconLabel.text = "📍"
        titleLabel.text = "근처 지역"
        subtitleLabel.text = "LIKE!"
    }
    
    required init(coder: NSCoder) {
        fatalError("fail to initialize \(PersonalizedKeywordMatchingCollectionViewCell.identifier)")
    }
}
