//
//  MainTabBarController.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/30/24.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

enum TabBarItem: Int, CaseIterable {
    case matching = 0, favor, chatting, myPage
    
    var title: String {
        switch self {
        case .matching: return "매칭"
        case .favor: return "호감"
        case .chatting: return "메세지"
        case .myPage: return "마이"
        }
    }
    
    var image: UIImage? {
        return nil
    }
    
    var selectedImage: UIImage? {
        return nil
    }
    
    var rootViewController: UIViewController {
        switch self {
        case .matching: return MatchingHomeViewController()
        case .favor: return FavorViewController()
        case .chatting: return MatchingHomeViewController()
        case .myPage: return FavorViewController()
        }
    }
}

final class MainTabBarController: UITabBarController, ViewModelBindable {
   
    typealias ViewModelType = MainTabBarViewModel
    
    var viewModel: MainTabBarViewModel!
    
    var tabBarItems: [TabBarItem] = TabBarItem.allCases
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func bindViewModel() {
        
    }
}

// MARK: - UITabBarControllerDelegate
extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, 
                          shouldSelect viewController: UIViewController) -> Bool {
        guard tabBarController.selectedViewController != viewController else { return false }
        
        let tabBarIndex = tabBarController.selectedIndex

        return true
    }
}
