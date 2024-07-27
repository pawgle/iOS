//
//  ViewModelStatus.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/24/24.
//

import RxSwift
import RxRelay

enum ViewModelStatus {
    case ready
    case loading
    case complete
    case update
    case cancel
}

protocol ViewModelStatusObservable {
    var status: BehaviorRelay<ViewModelStatus> { get set }
}

extension ViewModelStatusObservable {
    var statusValue: ViewModelStatus { status.value }
}
