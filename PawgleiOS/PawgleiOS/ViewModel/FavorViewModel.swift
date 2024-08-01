//
//  FavorViewModel.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/31/24.
//

import Foundation
import RxSwift
import RxRelay

final class FavorViewModel: ViewModelType {
    
    struct Input {
        var didTapTestButton: PublishRelay<Void>
    }
    
    struct Output {
        var showTestLog: PublishRelay<String>
    }
    
    struct Coordinate: DefaultCoordinate {
        var close: PublishRelay<Void>
        var showLog: PublishRelay<String>
    }
    
    var input: Input = Input(didTapTestButton: PublishRelay<Void>())
    
    lazy var output: Output = transform(input)
    
    var coordinate: Coordinate = Coordinate(close: PublishRelay<Void>(),
                                            showLog: PublishRelay<String>())
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        let showTestLog = PublishRelay<String>()
        
        input.didTapTestButton
            .map { "TEST Button Clicked"}
            .bind(to: showTestLog)
            .disposed(by: disposeBag)
        
        return Output(showTestLog: showTestLog)
    }
}
