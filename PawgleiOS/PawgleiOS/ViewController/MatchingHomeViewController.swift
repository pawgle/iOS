//
//  ViewController.swift
//  PawgleiOS
//
//  Created by peppermint100 on 7/21/24.
//

import UIKit
import RxSwift
import RxRelay

final class MatchingHomeViewController: UIViewController,
                                        ViewModelBindable {
    
    typealias ViewModelType = MatchingHomeViewModel
    var viewModel: MatchingHomeViewModel!
    var disposeBag = DisposeBag()
    
    private lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 10, height: 70)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.register(PersonalizedKeywordMatchingCollectionViewCell.self)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self) - \(#function)")
        view.backgroundColor = .gray100
        setupCV()
    }
    
    private func setupCV() {
        view.addSubview(cv)
        cv.backgroundColor = .gray100
        cv.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(400)
        }
        cv.dataSource = self
        cv.delegate = self
    }
    
    func bindViewModel() {
        
    }
}

extension MatchingHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: PersonalizedKeywordMatchingCollectionViewCell.self, at: indexPath)
        cell.configure()
        return cell
    }
}
