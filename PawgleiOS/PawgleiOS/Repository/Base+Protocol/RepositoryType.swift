//
//  RepositoryType.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/24/24.
//

import RxSwift

protocol RepositoryType {
    associatedtype Request: Encodable
    associatedtype Response: Decodable
    
    func fetchData() -> Observable<Response>
    func fetchData(_ request: Request) -> Observable<Response>
    func fetchData(_ apiPath: String) -> Observable<Response>
}
