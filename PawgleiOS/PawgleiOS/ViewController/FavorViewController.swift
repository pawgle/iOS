//
//  FavorViewController.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/31/24.
//

import Foundation
import UIKit
import RxSwift

final class FavorViewController: UIViewController,
                                 ViewModelBindable {
    
    typealias ViewModelType = FavorViewModel
    var viewModel: FavorViewModel!
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let testButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true
        button.setTitle("테스트", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.configureUI()
    }

    func configureUI() {
        view.addSubview(testButton)
        testButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.center.equalToSuperview()
        }
    }
    
    func bindViewModel() {
        testButton.rx.tap
            .share()
            .bind(to: viewModel.input.didTapTestButton)
            .disposed(by: disposeBag)
        
        testButton.rx.tap
            .share()
            .map { "Show Test Log" }
            .bind(to: viewModel.coordinate.showLog)
            .disposed(by: disposeBag)
        
        viewModel.output.showTestLog
            .bind { message in
                print(message)
            }
            .disposed(by: disposeBag)
    }
}
