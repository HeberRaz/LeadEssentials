//
//  LoginUseCaseFactoryTests.swift
//  LoginUseCaseOutputComposerTests
//
//  Created by Heber Raziel Alvarez Ruedas on 03/12/22.
//

import XCTest
@testable import CleanArchitectureComposition

class LoginUseCaseFactoryTests: XCTestCase {

    func test_createdUseCase_hasComposeOutputs() {
        let sut = LoginUseCaseFactory()
        let useCase = sut.makeUseCase()
        let composer = useCase.output as? LoginUseCaseOutputComposer
        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: FirebaseAnalyticsLoginTracker.self), 1)
    }
}

private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter { $0 is T }.count
    }
}
