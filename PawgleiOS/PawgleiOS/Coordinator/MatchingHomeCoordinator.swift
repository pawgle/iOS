//
//  HomeCoordinator.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/28/24.
//

import Foundation
import RxSwift

final class MatchingHomeCoordinator: ReactiveCoordinator<Void>,
                             CoordinatorTransitable {
    
    override func start(_ type: CoordinatorTransitionType) -> Observable<Void> {
        
        let viewModel = MatchingHomeViewModel()
        let viewController = MatchingHomeViewController(viewModel: viewModel)
        
        self.transition(to: viewController,
                        navigationController: navigationController,
                        type: .push,
                        animated: false)
        
        return Observable.empty()
    }
}
