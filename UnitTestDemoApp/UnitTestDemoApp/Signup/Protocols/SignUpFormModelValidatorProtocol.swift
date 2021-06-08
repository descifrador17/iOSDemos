//
//  SignUpFormModelValidatorProtocol.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation

protocol SignUpFormModelValidatorProtocol{
    func isNameValid(name: String) -> Bool
    func isPhoneNumberValid(phoneNumber: String) -> Bool
    func isEmailValid(email: String) -> Bool
    func doesPasswordMatch(password: String, repeatPassword: String) -> Bool
}
