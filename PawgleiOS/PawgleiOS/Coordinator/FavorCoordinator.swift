//
//  FavorCoordinator.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/31/24.
//

import Foundation
import RxSwift
import RxRelay

final class FavorCoordinator: ReactiveCoordinator<Void>,
                              CoordinatorTransitable {
    override func start(_ type: CoordinatorTransitionType) -> Observable<Void> {
        let viewModel = FavorViewModel()
        let viewController = FavorViewController(viewModel: viewModel)

        viewModel.coordinate.showLog
            .bind { message in
                print("Coordinate - \(message)")
            }
            .disposed(by: disposeBag)
        
        self.transition(to: viewController,
                        navigationController: navigationController,
                        type: .push,
                        animated: false)
        
        return Observable.empty()
    }
}
