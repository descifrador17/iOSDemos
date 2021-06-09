//
//  SignupPresenter.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol{
    
    private var formModelValidator: SignUpFormModelValidatorProtocol
    private var signupWebService: SignupWebServiceProtocol
    private var delegate: SignupViewDelegateProtocol
    
    required init(formModelValidator: SignUpFormModelValidatorProtocol, signupWebService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.signupWebService = signupWebService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel){
        if !formModelValidator.isNameValid(name: formModel.firstName){
            return
        }
        if !formModelValidator.isNameValid(name: formModel.lastName){
            return
        }
        if !formModelValidator.isPhoneNumberValid(phoneNumber: formModel.phoneNumber){
            return
        }
        if !formModelValidator.isEmailValid(email: formModel.email){
            return
        }
        if !formModelValidator.doesPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword){
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
            
        self.signupWebService.signup(withFormModel : requestModel){[weak self] (signupResponseModel, error) in
            //Working
            if let error = error {
                self?.delegate.errorHandler(error: error)
                return
            }
            
            if let _ = signupResponseModel{
                self?.delegate.successfulSignup()
                return
            }
            
            
        }
    }
}
