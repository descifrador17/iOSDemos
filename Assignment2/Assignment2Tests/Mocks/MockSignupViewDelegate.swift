//
//  MockSignupViewDelegate.swift
//  Assignment2Tests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation
import XCTest
@testable import Assignment2

class MockSignupViewDelegate: SignupViewDelegateProtocol{
    var expectation: XCTestExpectation?
    var isSuccessfulSignup = false
    var isUnsuccessfulSignup = false
    var error: FormErrors?
    
    func successfulSignup() {
        self.isSuccessfulSignup = true
        self.expectation?.fulfill()
    }
    
    func errorHandler(error: FormErrors){
        self.error = error
        self.isUnsuccessfulSignup = true
        self.expectation?.fulfill()
    }
    
}
