//
//  AppCoordinator.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation
import RxSwift
import UIKit

final class AppCoordinator: ReactiveCoordinator<Void>,
                      CoordinatorTransitable {
    
    static let shared = AppCoordinator(navigationController: UINavigationController())
    
    var viewController: UIViewController?
    var splashCoordinator: Disposable!
    
    var window: UIWindow!
    
    func start(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
       
        self.splashCoordinator = self.coordinateToSplash()
            .asObservable()
            .subscribe(onNext: { [weak self] result in
                self?.handleSplashCoordinatorResult(result: result)
            })
    }
   
    func topViewController() -> UIViewController? {
        return self.navigationController.viewControllers.last
    }

    func toRootCoordinator() {
        guard let root = self.childCoordinators.first?.value else { return }
        root.removeAll()
    }
}

// MARK: -
private extension AppCoordinator {
    func coordinateToSplash() -> Observable<SplashCoordinatorResult> {
        let coordinator = SplashCoordinator(navigationController: navigationController)
        return self.coordinate(to: coordinator, type: .push, animated: true)
    }
    
    func coordinateToHome() -> Observable<Void> {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        return self.coordinate(to: coordinator, type: .push, animated: false)
    }
}

// MARK: -
private extension AppCoordinator {
    func handleSplashCoordinatorResult(result: SplashCoordinatorResult) {
        switch result {
        case .goSignIn:
            print("go SignIn")
        case .goHome:
            self.coordinateToHome()
                .subscribe(onNext: {})
                .disposed(by: disposeBag)
        case .pop:
            print("pop")
        }
    }
}
