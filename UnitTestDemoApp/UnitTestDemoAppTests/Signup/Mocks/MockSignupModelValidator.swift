//
//  MockSignupValidator.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation
@testable import UnitTestDemoApp

class MockSignupModelValidator: SignUpFormModelValidatorProtocol{
    
    var isFirstNameValid = false
    var isLastNameValid = false
    var isPhoneNumberValid = false
    var isEmailValid = false
    var doesPasswordMatch = false
    
    func isNameValid(name: String) -> Bool{
        self.isFirstNameValid = true
        self.isLastNameValid = true
        return self.isFirstNameValid && self.isLastNameValid
    }

    func isPhoneNumberValid(phoneNumber: String) -> Bool{
        self.isPhoneNumberValid = true
        return self.isPhoneNumberValid
    }
    
    func isEmailValid(email: String) -> Bool{
        self.isEmailValid = true
        return self.isEmailValid
    }
    
    func doesPasswordMatch(password: String, repeatPassword: String) -> Bool{
        self.doesPasswordMatch = true
        return self.doesPasswordMatch
    }
}
