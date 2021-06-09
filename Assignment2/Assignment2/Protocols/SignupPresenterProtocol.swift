//
//  SignupPresenterProtocol.swift
//  Assignment2
//
//  Created by Dayal, Utkarsh on 09/06/21.
//

import Foundation

protocol SignupPresenterProtocol{
    init(formModelValidator: FormModelValidatorProtocol, delegate: SignupViewDelegateProtocol)
    
    func processSignup(formModel: FormModel)
}
