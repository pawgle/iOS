//
//  BlurProfileCardCollectionViewCell.swift
//  PawgleiOS
//
//  Created by peppermint100 on 8/5/24.
//

import UIKit
import SnapKit
import Kingfisher

final class BlurableProfileCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BlurableProfileCollectionViewCell"

    private let containerView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        return sv
    }()
    
    private let profileImageView: BlurableImageView = {
        let iv = BlurableImageView(frame: .zero)
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private let lockImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = R.image.locked()
        return iv
    }()
    
    private let profileView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let labelView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.pretendardSemiBold(size: 18)
        label.textColor = .black
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.pretendardMedium(size: 13)
        label.textColor = .gray400
        return label
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.bone14(), for: .normal)
        button.setTitle("펫 프로필", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = R.font.pretendardMedium(size: 12)
        button.backgroundColor = .gray800
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 2)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupContainerView()
        setupProfileImageView()
        setupProfileView()
        setupLabels()
        setupProfileButton()
    }
    
    private func setupContainerView() {
        contentView.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
    }
    
    private func setupProfileImageView() {
        containerView.addArrangedSubview(profileImageView)
        profileImageView.addSubview(lockImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.75)
        }
        
        lockImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupProfileView() {
        containerView.addArrangedSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.25)
        }
    }
    
    private func setupLabels() {
        profileView.addSubview(labelView)
        labelView.addArrangedSubview(titleLabel)
        labelView.addArrangedSubview(subtitleLabel)
        
        labelView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(25)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func setupProfileButton() {
        profileView.addSubview(profileButton)
        profileButton.layer.cornerRadius = 8
        profileButton.clipsToBounds = true
        profileButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.width.equalTo(86)
            make.height.equalTo(38)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("fail to initialize \(BlurableProfileCollectionViewCell.identifier)")
    }
    
    // TODO: API 연동 결과에 따른 뷰 프로퍼티 세팅
    func configure() {
        let imageURLString = "https://static.wikia.nocookie.net/pokemon/images/8/8f/%ED%8C%8C%EC%98%A4%EB%A6%AC_%EA%B3%B5%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.png/revision/latest?cb=20170405020947&path-prefix=ko"
        let imageURL = URL(string: imageURLString)
        profileImageView.kf.setImage(with: imageURL)
        titleLabel.text = "닉네임, 24세"
        subtitleLabel.text = "댕댕이 집사 서울/서초구"
        profileImageView.blur = true
        lockImageView.isHidden = false
    }
}
