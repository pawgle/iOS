//
//  InputOutputAttachable.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation
import RxSwift
import RxRelay

protocol InputOutputAttachable {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get set }
    var output: Output { get set }
    
    func transform(_ input: Input) -> Output
}

protocol DefaultInput {
    var fetchData: PublishRelay<Void> { get set }
}
