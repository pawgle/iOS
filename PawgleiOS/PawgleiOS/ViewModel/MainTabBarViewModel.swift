//
//  MainTabBarCoordinator.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/31/24.
//

import Foundation
import RxSwift
import RxRelay

final class MainTabBarViewModel: ViewModelType {
    
    struct Input: DefaultInput {
        var fetchData: PublishRelay<Void>
        var loadTab: PublishRelay<TabBarItem>
    }
    
    struct Output {
        
    }
    
    struct Coordinate: DefaultCoordinate {
        var close: PublishRelay<Void>
        var loadTab: PublishRelay<TabBarItem>
    }
    
    var input: Input = Input(fetchData: PublishRelay<Void>(),
                             loadTab: PublishRelay<TabBarItem>())
    
    lazy var output: Output = transform(input)
    
    var coordinate: Coordinate = Coordinate(close: PublishRelay<Void>(),
                                            loadTab: PublishRelay<TabBarItem>())
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        
        input.loadTab
            .bind(to: coordinate.loadTab)
            .disposed(by: disposeBag)
        
        return Output()
    }
}
