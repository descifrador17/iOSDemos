//
//  MockFormModelValidator.swift
//  Assignment2Tests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation
@testable import Assignment2

class MockFormModelValidator: FormModelValidatorProtocol{
    
    var shouldReturnError = false
    
    var isfirstNameValid = false
    var isLastnameValid = false
    var isPhoneNumberValid = false
    var isEmailValid = false
    var doesPasswordMatch = false
    
    func isNameValid(name: String) -> Bool {
        if shouldReturnError{
            return false
        }
        self.isfirstNameValid = true
        self.isLastnameValid = true
        return self.isLastnameValid && self.isfirstNameValid
    }
    
    func isPhoneNumberValid(phoneNumber: String) -> Bool {
        if shouldReturnError{
            return false
        }
        self.isPhoneNumberValid = true
        return self.isPhoneNumberValid
    }
    
    func isEmailValid(email: String) -> Bool {
        if shouldReturnError{
            return false
        }
        self.isEmailValid = true
        return self.isEmailValid
    }
    
    func doesPasswordMatch(password: String, repeatPassword: String) -> Bool {
        if shouldReturnError{
            return false
        }
        self.doesPasswordMatch = true
        return self.doesPasswordMatch
    }
    
    
}
