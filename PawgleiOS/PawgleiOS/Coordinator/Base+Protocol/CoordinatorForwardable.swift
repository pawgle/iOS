//
//  CoordinatorForwardable.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation
import RxSwift
import RxRelay

public enum ForwardScene: Equatable {
    case home
    case none
}

protocol CoordinatorForwardable {
    var forward: PublishRelay<ForwardScene> { get set }
    var disposeBag: DisposeBag { get set }
    var currentScene: ForwardScene { get set }
    var lastScene: ForwardScene { get set }
    
    func coordinate<T>(to coordinator: ReactiveCoordinator<T>,
                       type: CoordinatorTransitionType,
                       animated: Bool) -> Observable<T>
}

extension CoordinatorForwardable where Self: BaseCoordinator {
    
}
