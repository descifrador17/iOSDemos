//
//  SignupErrors.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 07/06/21.
//

import Foundation

enum SignupError: Error, Equatable{
    case invalidJSONResponse
    case invalidRequestURLString
    case failedUrlRequest
}
