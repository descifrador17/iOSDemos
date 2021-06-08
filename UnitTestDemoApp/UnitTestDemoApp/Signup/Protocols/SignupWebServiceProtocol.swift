//
//  SignUpWebServiceProtocol.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation

protocol SignupWebServiceProtocol{
    func signup(withFormModel : SignupFormRequestModel, completionHandler : @escaping (SignupFormResponseModel?, SignupError?) -> Void)
}
