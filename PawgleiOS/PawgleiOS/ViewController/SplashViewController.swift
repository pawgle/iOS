//
//  SplashViewController.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation
import UIKit
import RxSwift

final class SplashViewController: UIViewController,
                                  ViewModelBindable {
   
    typealias ViewModelType = SplashViewModel
    
    var viewModel: SplashViewModel!
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        self.viewModel.input.fetchData.accept(())
        
        print("\(self) - \(#function)")
    }
    
    func bindViewModel() {
        self.viewModel.input.fetchData
            .bind(to: self.viewModel.coordinate.goHome)
            .disposed(by: disposeBag)
    }
}
