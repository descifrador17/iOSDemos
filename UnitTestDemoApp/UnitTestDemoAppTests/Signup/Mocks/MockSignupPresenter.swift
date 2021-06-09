//
//  MockSignupPresenter.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 09/06/21.
//

import Foundation
@testable import UnitTestDemoApp

class MockSignupPresenter: SignupPresenterProtocol{
    
    var isProcessUserSignupCalled = false
    
    required init(formModelValidator: SignUpFormModelValidatorProtocol, signupWebService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        //TODO
    }
    
    
    func processUserSignup(formModel: SignupFormModel) {
        self.isProcessUserSignupCalled = true
    }
    
}
