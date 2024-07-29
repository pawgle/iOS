//
//  ViewModelCoordinatable.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation
import RxSwift
import RxRelay

protocol ViewModelCoordinatable: DefaultCoordinatable {
    associatedtype Coordinate: DefaultCoordinate
    
    var coordinate: Coordinate { get set }
}

extension ViewModelCoordinatable {
    var coordinate: DefaultCoordinate { return coordinate }
}

protocol DefaultCoordinatable {
    var coordinate: DefaultCoordinate { get }
}

protocol DefaultCoordinate {
    var close: PublishRelay<Void> { get set }
}
