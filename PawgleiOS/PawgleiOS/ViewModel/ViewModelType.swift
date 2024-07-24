//
//  ViewModelType.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/24/24.
//

import RxSwift

protocol ViewModelType {
    associatedtype Repository: RepositoryType
    
    var repository: Repository { get set }
}

class BaseViewModel<RP: RepositoryType>: ViewModelType {
    typealias Repository = RP
    
    var repository: Repository
    var disposeBag = DisposeBag()
    
    init(repository: Repository) {
        self.repository = repository
        
    }
}

extension BaseViewModel {
    func fetchData() -> Observable<Repository.Response> {
        return repository.fetchData()
    }
    
    func fetchData(_ request: Repository.Request) -> Observable<Repository.Response> {
        return repository.fetchData(request)
    }
    
    func fetchData(_ apiPath: String) -> Observable<Repository.Response> {
        return repository.fetchData(apiPath)
    }
}
