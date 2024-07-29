//
//  SplashRepository.swift
//  PawgleiOS
//
//  Created by Junho Yoon on 7/27/24.
//

import Foundation

protocol AuthRepositoryType {
    func signIn()
    func signUp()
}

struct AuthRepositoryTest: AuthRepositoryType {
  
    
    func signIn() {
        print("Test - Sign in")
    }
    
    func signUp() {
       print("Test - Sign Up")
    }
}
