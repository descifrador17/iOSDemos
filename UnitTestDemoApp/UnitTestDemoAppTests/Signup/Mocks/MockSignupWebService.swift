//
//  MockSignupWebService.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation
@testable import UnitTestDemoApp

class MockSignupWebService: SignupWebServiceProtocol{
    var isSignupCalled = false
    
    func signup(withFormModel: SignupFormRequestModel, completionHandler: @escaping (SignupFormResponseModel?, SignupError?) -> Void) {
        isSignupCalled = true
        
        let signupResponseModel = SignupFormResponseModel(status: "ok")
        completionHandler(signupResponseModel,nil)
    }
    
}
