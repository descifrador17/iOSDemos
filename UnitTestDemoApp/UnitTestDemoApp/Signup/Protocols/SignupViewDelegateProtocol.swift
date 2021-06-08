//
//  SignupViewDelegateProtocol.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import Foundation

protocol SignupViewDelegateProtocol{
    func successfulSignup()
    func errorHandler(error: SignupError)
    
}
