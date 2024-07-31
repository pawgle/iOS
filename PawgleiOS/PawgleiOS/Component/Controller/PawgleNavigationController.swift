//
//  PawgleNavigationController.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/31/24.
//

import UIKit

class PawgleNavigationController: UINavigationController {
    
}

extension PawgleNavigationController: UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .white
        
        interactivePopGestureRecognizer?.delegate = self
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
