//
//  SignupFormRequestModel.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 07/06/21.
//

import Foundation

struct SignupFormRequestModel: Encodable{
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
