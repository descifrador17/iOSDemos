//
//  MockSignupPresenter.swift
//  Assignment2Tests
//
//  Created by Dayal, Utkarsh on 09/06/21.
//

import Foundation
@testable import Assignment2

class MockSignupPresenter: SignupPresenterProtocol{
    
    var isSignupProcessCalled = false
    
    required init(formModelValidator: FormModelValidatorProtocol, delegate: SignupViewDelegateProtocol) {
        //TODO
    }
    
    func processSignup(formModel: FormModel) {
        self.isSignupProcessCalled = true
    }
    
}
