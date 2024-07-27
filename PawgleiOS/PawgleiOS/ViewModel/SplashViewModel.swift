//
//  SplashViewModel.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation
import RxSwift
import RxRelay

final class SplashViewModel: ViewModelType {

    struct Input: DefaultInput {
        var fetchData: PublishRelay<Void>
    }
    
    struct Output { }
   
    struct Coordinate: DefaultCoordinate {
        var close: PublishRelay<Void>
        var goHome: PublishRelay<Void>
    }
    
    var disposeBag: DisposeBag = DisposeBag()
   
    lazy var input: Input = Input(fetchData: PublishRelay<Void>())
    
    lazy var output: Output = transform(input)
    
    lazy var coordinate: Coordinate = Coordinate(close: PublishRelay<Void>(),
                                                 goHome: PublishRelay<Void>())
    let usecase: AuthUsecase
    
    init(usecase: AuthUsecase) {
        self.usecase = usecase
    }
    
    func transform(_ input: Input) -> Output {
        print("\(#function)")
        
        return Output()
    }
}
