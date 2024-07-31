//
//  MainTabBarCoordinator.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/31/24.
//

import RxSwift
import RxRelay

final class MainTabBarCoordinator: ReactiveCoordinator<Void>,
                                   CoordinatorTransitable {
    
    var tabCoordinators: [ReactiveCoordinator<Void>] = []
    
    override func start(_ type: CoordinatorTransitionType) -> Observable<Void> {
        let viewModel = MainTabBarViewModel()
        let viewController = MainTabBarController(viewModel: viewModel)
     
        self.transition(to: viewController,
                        navigationController: navigationController,
                        type: .push,
                        animated: false)
 
        AppCoordinator.shared.viewController = viewController
        
        self.tabCoordinators = TabBarItem.allCases.map { makeTabCoordinator(item: $0) }
     
        viewController.setViewControllers(tabCoordinators.map { $0.navigationController}, 
                                          animated: false)
        
        return Observable.empty()
    }
}

private extension MainTabBarCoordinator {
    func makeTabCoordinator(item: TabBarItem) -> ReactiveCoordinator<Void> {
        let navigationController = PawgleNavigationController()
        let tabItem = UITabBarItem(title: item.title,
                                   image: item.image,
                                   selectedImage: item.selectedImage)
        
        tabItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        navigationController.tabBarItem = tabItem
        navigationController.tabBarController?.tabBar.backgroundColor = .white
        
        var coordinator: ReactiveCoordinator<Void>
        
        switch item {
        case .matching:
            coordinator = MatchingHomeCoordinator(navigationController: navigationController)
        case .favor:
            coordinator = FavorCoordinator(navigationController: navigationController)
        case .chatting:
            coordinator = MatchingHomeCoordinator(navigationController: navigationController)
        case .myPage:
            coordinator = FavorCoordinator(navigationController: navigationController)
        }
        
        coordinator.start(.push)
            .bind { _ in }
            .disposed(by: disposeBag)
    
        return coordinator
    }
}
