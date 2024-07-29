//
//  AuthUsecase.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation

struct AuthUsecase {
    private let repository: AuthRepositoryType
    
    init(repository: AuthRepositoryType) {
        self.repository = repository
    }
    
    func signIn() {
        return self.repository.signIn()
    }
    
    func signUp() {
        return self.repository.signUp()
    }
}
