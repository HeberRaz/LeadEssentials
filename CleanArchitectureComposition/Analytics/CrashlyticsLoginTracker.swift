//
//  CrashlyticsLoginTracker.swift
//  CleanArchitectureComposition
//
//  Created by Heber Raziel Alvarez Ruedas on 03/12/22.
//

import Foundation

final class CrashlyticsLoginTracker: LoginUseCaseOutput {
    func loginSucceeded() {
        // Send login event to chrashlytics
    }
    
    func loginFailed() {
        // Send error to crashlytics
    }
}
