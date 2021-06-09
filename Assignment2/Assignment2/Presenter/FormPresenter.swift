//
//  FormPresenter.swift
//  Assignment2
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation

class FormPresenter: SignupPresenterProtocol{
    
    private var formModelValidator: FormModelValidatorProtocol
    private var delegate: SignupViewDelegateProtocol
    
    required init(formModelValidator: FormModelValidatorProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.delegate = delegate
    }
    
    func processSignup(formModel: FormModel){
        
        if formModelValidator.isNameValid(name: formModel.firstName) && formModelValidator.isNameValid(name: formModel.lastName) && formModelValidator.isEmailValid(email: formModel.email) && formModelValidator.isPhoneNumberValid(phoneNumber: formModel.phoneNumber) && formModelValidator.doesPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword){
            
            //Notify Success to View Controller
            self.delegate.successfulSignup()
        }
        else{
            //Notify Error to View Controller
            self.delegate.errorHandler(error: FormErrors.invalidFormData)
        }
        
    }
    
}
