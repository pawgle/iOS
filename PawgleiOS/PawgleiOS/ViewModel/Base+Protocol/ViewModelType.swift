//
//  ViewModelType.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/24/24.
//

import RxSwift

protocol ViewModelType: InputOutputAttachable,
                        ViewModelCoordinatable {
    var disposeBag: DisposeBag { get set }
}
