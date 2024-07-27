//
//  HomeViewModel.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/28/24.
//

import Foundation
import RxSwift
import RxRelay

final class HomeViewModel: ViewModelType {
    
    struct Input: DefaultInput {
        var fetchData: PublishRelay<Void>
    }
    
    struct Output {
        
    }
    
    struct Coordinate: DefaultCoordinate {
        var close: PublishRelay<Void>
    }
    
    var input: Input = Input(fetchData: PublishRelay<Void>())
    
    lazy var output: Output = transform(input)
    
    lazy var coordinate: Coordinate = Coordinate(close: PublishRelay<Void>())
    
   
    func transform(_ input: Input) -> Output {
        
        return Output()
    }
}
