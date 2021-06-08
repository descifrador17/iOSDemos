//
//  MockSignupViewDelegate.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation
import XCTest
@testable import UnitTestDemoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol{
    
    var expectation: XCTestExpectation?
    
    func successfulSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        
    }
    
}
