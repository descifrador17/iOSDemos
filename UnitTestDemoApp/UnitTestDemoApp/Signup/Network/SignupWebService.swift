//
//  SignupWebService.swift
//  UnitTestDemoApp
//
//  Created by Dayal, Utkarsh on 07/06/21.
//

import Foundation

class SignupWebService{
    
    private var urlSession: URLSession
    
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withFormModel : SignupFormRequestModel, completionHandler : @escaping (SignupFormResponseModel?, SignupError?) -> Void){
        
        guard let url = URL(string: self.urlString) else{
            //TODO - Create a unit test for invalid URL
            completionHandler(nil,SignupError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(withFormModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            //TODO - Unit test to handle failed Request Error
            if let requestError = error {
                completionHandler(nil, SignupError.failedUrlRequest)
                return
            }
            
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupFormResponseModel.self, from: data){
                completionHandler(signupResponseModel, nil)
            }
            else{
                //TODO - Unit Test to handle JSON Parsing Error
                completionHandler(nil, SignupError.invalidJSONResponse) 
            }
        }
        
        dataTask.resume()
        
    }
     
}
