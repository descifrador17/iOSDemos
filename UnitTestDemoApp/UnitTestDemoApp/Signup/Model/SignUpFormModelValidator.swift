//
//  SignUpFormModelValidator.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 03/06/21.
//

import Foundation

class SignUpFormModelValidator: SignUpFormModelValidatorProtocol{
    
    func isNameValid(name: String) -> Bool{
        let nameRegEx = "[A-Za-z]{3,15}"
        let namePred = NSPredicate(format:"SELF MATCHES [c] %@", nameRegEx)
        return namePred.evaluate(with: name)
    }

    func isPhoneNumberValid(phoneNumber: String) -> Bool{
        let numberRegEx = "[0-9]{10}$"
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberPred.evaluate(with: phoneNumber)
    }
    
    func isEmailValid(email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func doesPasswordMatch(password: String, repeatPassword: String) -> Bool{
        if password.isEmpty || repeatPassword.isEmpty{
            return false
        }
        return password == repeatPassword
    }
}
