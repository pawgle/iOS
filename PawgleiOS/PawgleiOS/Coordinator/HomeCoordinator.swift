//
//  HomeCoordinator.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/28/24.
//

import Foundation
import RxSwift

final class HomeCoordinator: ReactiveCoordinator<Void>,
                             CoordinatorTransitable {
    
    override func start(_ type: CoordinatorTransitionType) -> Observable<Void> {
        
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        
        self.transition(to: viewController,
                        navigationController: navigationController,
                        type: .push,
                        animated: false)
        
        AppCoordinator.shared.viewController = viewController
        
        return Observable.empty()
    }
}
