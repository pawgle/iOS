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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red200
        view.addSubview(imageView)
        
        print("\(self) - \(#function)")
    }
    
    override func viewDidLayoutSubviews() {
        imageView.frame = CGRect(
            x: (view.frame.size.width - 24) / 2,
            y: (view.frame.size.height - 24) / 2,
            width: 24,
            height: 24)
    }
    
    func bindViewModel() {
        
    }
}
