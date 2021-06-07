//
//  MockUrlProtocol.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 07/06/21.
//

import Foundation

class MockURLProtocol: URLProtocol{
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let signupError = MockURLProtocol.error{
            print(signupError.localizedDescription)
            self.client?.urlProtocol(self, didFailWithError: signupError)
        }
        else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
