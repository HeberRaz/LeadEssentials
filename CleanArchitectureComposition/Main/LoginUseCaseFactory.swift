//
//  LoginUseCaseFactory.swift
//  CleanArchitectureComposition
//
//  Created by Heber Raziel Alvarez Ruedas on 03/12/22.
//

import Foundation

final class LoginUseCaseFactory: LoginUseCaseOutput {
    
    func makeUseCase() -> LoginUseCase {
        return LoginUseCase(output: LoginUseCaseOutputComposer([
            LoginPresenter(),
            CrashlyticsLoginTracker(),
            FirebaseAnalyticsLoginTracker()
        ]))
    }
    
    func loginSucceeded() {
        //
    }
    
    func loginFailed() {
        //
    }
}
