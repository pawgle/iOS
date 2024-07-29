//
//  ViewController.swift
//  PawgleiOS
//
//  Created by peppermint100 on 7/21/24.
//

import UIKit
import RxSwift
import RxRelay

final class HomeViewController: UIViewController,
                                ViewModelBindable {
  
    typealias ViewModelType = HomeViewModel
    var viewModel: HomeViewModel!
    var disposeBag = DisposeBag()
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = R.image.award()
        return iv
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "테스트 레이블"
        label.textAlignment = .center
        label.font = R.font.pretendardMedium(size: 32)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red200
        view.addSubview(imageView)
        view.addSubview(label)
        
        print("\(self) - \(#function)")
    }
    
    override func viewDidLayoutSubviews() {
        imageView.frame = CGRect(
            x: (view.frame.size.width - 24) / 2,
            y: (view.frame.size.height - 24) / 2,
            width: 24,
            height: 24)
        
        let labelWidth: CGFloat = 200
        let labelHeight: CGFloat = 50
        label.frame = CGRect(
            x: (view.frame.size.width - labelWidth) / 2,
            y: view.frame.size.height - labelHeight - 100,
            width: labelWidth,
            height: labelHeight
        )
    }
    
    func bindViewModel() {
        
    }
}
