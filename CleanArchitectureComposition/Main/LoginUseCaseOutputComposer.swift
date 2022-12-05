//
//  LoginUseCaseOutputComposer.swift
//  CleanArchitectureComposition
//
//  Created by Heber Raziel Alvarez Ruedas on 03/12/22.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    let outputs: [LoginUseCaseOutput]
    
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    func loginSucceeded() {
        outputs.forEach{ $0.loginSucceeded() }
    }
    
    func loginFailed() {
        outputs.forEach{ $0.loginFailed() }
    }
}

func compose<T>(_ outputs: [(T) -> Void]) -> (T) -> Void {
    return { value in
        outputs.forEach { $0(value) }
    }
}
