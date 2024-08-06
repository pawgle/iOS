//
//  ViewController.swift
//  PawgleiOS
//
//  Created by peppermint100 on 7/21/24.
//

import UIKit
import SnapKit
import RxSwift
import RxRelay

final class MatchingHomeViewController: UIViewController,
                                ViewModelBindable {
  
    typealias ViewModelType = MatchingHomeViewModel
    var viewModel: MatchingHomeViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self) - \(#function)")
        view.backgroundColor = .systemBackground
    }
    
    func bindViewModel() {
    }
}
