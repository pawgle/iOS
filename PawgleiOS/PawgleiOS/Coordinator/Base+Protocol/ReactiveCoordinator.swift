//
//  ReactiveCoordinator.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation
import RxSwift
import RxRelay

class ReactiveCoordinator<ResultType>: BaseCoordinator,
                                       CoordinatorForwardable {
    public typealias CoordinatorResultType = ResultType
    
    var forward = PublishRelay<ForwardScene>()
    var currentScene: ForwardScene = .none
    var lastScene: ForwardScene = .none
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    deinit {
        self.disposeBag = DisposeBag()
        print("deinit - \(self)")
    }
    
    @discardableResult
    func coordinate<T>(to coordinator: ReactiveCoordinator<T>,
                       type: CoordinatorTransitionType,
                       animated: Bool) -> Observable<T> {
        self.store(coordinator: coordinator)
        return coordinator.start(type)
            .do(onNext: { [weak self] _ in
                self?.release(coordinator: coordinator)
            })
    }
 
    open func start(_ type: CoordinatorTransitionType) -> Observable<ResultType> {
        fatalError("start() method must be implemented")
    }
}
