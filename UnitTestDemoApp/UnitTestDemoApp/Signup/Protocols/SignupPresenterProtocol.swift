//
//  SignupPresenterProtocol.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 09/06/21.
//

import Foundation

protocol SignupPresenterProtocol{
    
    init(formModelValidator: SignUpFormModelValidatorProtocol, signupWebService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    
    func processUserSignup(formModel: SignupFormModel)
}
