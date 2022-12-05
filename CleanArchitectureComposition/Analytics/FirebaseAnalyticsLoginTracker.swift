//
//  FirebaseAnalyticsLoginTracker.swift
//  CleanArchitectureComposition
//
//  Created by Heber Raziel Alvarez Ruedas on 03/12/22.
//

import Foundation

final class FirebaseAnalyticsLoginTracker: LoginUseCaseOutput {
    func loginSucceeded() {
        // Send login event to firebase
    }
    
    func loginFailed() {
        // Send error to firebase
    }
}
