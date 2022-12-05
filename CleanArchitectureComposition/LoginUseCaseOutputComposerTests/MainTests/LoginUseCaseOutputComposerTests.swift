//
//  LoginUseCaseOutputComposerTests.swift
//  LoginUseCaseOutputComposerTests
//
//  Created by Heber Raziel Alvarez Ruedas on 03/12/22.
//

import XCTest
@testable import CleanArchitectureComposition

class LoginUseCaseOutputComposerTests: XCTestCase {
    private var sut: LoginUseCaseOutput!

    override func setUp() {
        super.setUp()
        sut = LoginUseCaseOutputComposer([])
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_composingZeroOutputs_doesNotCrash() {
        sut.loginSucceeded()
        sut.loginFailed()
    }
    
    func test_composingMultipleOutput_delegatesSucceededMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginSucceeded()
        
        XCTAssertEqual(output1.loginSucceededCallCount, 1)
        XCTAssertEqual(output1.loginFailedCallCount, 0)
        
        XCTAssertEqual(output2.loginSucceededCallCount, 1)
        XCTAssertEqual(output2.loginFailedCallCount, 0)
    }
    
    func test_composingMultipleOutput_delegatesFailedMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginFailed()
        
        XCTAssertEqual(output1.loginSucceededCallCount, 0)
        XCTAssertEqual(output1.loginFailedCallCount, 1)
        
        XCTAssertEqual(output2.loginSucceededCallCount, 0)
        XCTAssertEqual(output2.loginFailedCallCount, 1)
    }
    
    // MARK: - Helpers
    
    private class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        var loginSucceededCallCount = 0
        var loginFailedCallCount = 0
        func loginSucceeded() {
            loginSucceededCallCount += 1
        }
        
        func loginFailed() {
            loginFailedCallCount += 1
        }
    }
}
