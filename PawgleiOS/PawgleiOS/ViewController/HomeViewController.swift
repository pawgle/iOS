//
//  ViewController.swift
//  PawgleiOS
//
//  Created by peppermint100 on 7/21/24.
//

import UIKit
import RxSwift
import RxRelay

class HomeViewController: UIViewController,
                          ViewModelBindable {
  

    typealias ViewModelType = HomeViewModel
    var viewModel: HomeViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        print("\(self) - \(#function)")
    }
    
    func bindViewModel() {
        
    }
}

