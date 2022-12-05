//
//  LoginUseCase.swift
//  CleanArchitectureComposition
//
//  Created by Heber Raziel Alvarez Ruedas on 03/12/22.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSucceeded()
    func loginFailed() 
}

final class LoginUseCase {
    let output: LoginUseCaseOutput
    
    init(output: LoginUseCaseOutput) {
        self.output = output
    }
    
    func login(name: String, password: String) {
        // if success output.loginSucceeded()
        // else output.loginFailed()
    }
}
