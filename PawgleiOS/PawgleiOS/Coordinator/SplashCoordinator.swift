//
//  SplashCoordinator.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation
import RxSwift

enum SplashCoordinatorResult {
    case goSignIn
    case goHome
    case pop
}

class SplashCoordinator: ReactiveCoordinator<SplashCoordinatorResult>,
                               CoordinatorTransitable {
    
    override func start(_ type: CoordinatorTransitionType) -> Observable<SplashCoordinatorResult> {
    
        let repository = AuthRepositoryTest()
        let usecase = AuthUsecase(repository: repository)
        let viewModel = SplashViewModel(usecase: usecase)
        let viewController = SplashViewController(viewModel: viewModel)
       
        let goHome = viewModel.coordinate.goHome.map { SplashCoordinatorResult.goHome }
        
        let interaction = self.transition(to: viewController,
                                       navigationController: navigationController,
                                       type: .push,
                                       animated: false)
            .map { SplashCoordinatorResult.pop }
        
        return Observable.merge(goHome, interaction)
            .take(1)
            .do { [weak self] _ in
                self?.targetPop(viewController, afterDelay: 0.5)
            }
    }
    
}
