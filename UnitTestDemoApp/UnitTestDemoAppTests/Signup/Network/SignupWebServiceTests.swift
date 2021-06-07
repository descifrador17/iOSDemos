//
//  SignupWebServiceTests.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 07/06/21.
//

import XCTest
@testable import UnitTestDemoApp

class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!

    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        
        //For integration Testing
        sut = SignupWebService(urlString: Constants.signupURL,urlSession: urlSession)
        
        //Actual Request Body
        signupFormRequestModel = SignupFormRequestModel(firstName: "Utkarsh", lastName: "Dayal", email: "utkarshdayal.17@gmail.com", password: "sample")
        
    }

    override func tearDownWithError() throws {
        
        self.sut = nil
        self.signupFormRequestModel = nil
    }

    //MARK: - TESTS FOR WEB SERVICE
    func testSignupWebService_WhenGivenSuccessfulResponse_ShouldReturnSuccess(){
        //For Mock
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //For waiting on the async call
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        //Act
        sut.signup(withFormModel : signupFormRequestModel){ (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok","signup() should have returned TRUE for getting response")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDiffJSONResponse_ShouldReturnFalse(){
        //For Mock
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //For waiting on the async call
        let expectation = self.expectation(description: "Signup Web Service Response with different JSON Structure Expectation")
        
        //Act
        sut.signup(withFormModel : signupFormRequestModel){ (signupResponseModel, error) in
            //Assert
            XCTAssertNil(signupResponseModel,"The Response Model should be nil ")
            XCTAssertEqual(error, SignupError.invalidJSONResponse, "Specified Error should have been passed")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenInvalidUrlPassed_ShouldReturnFalse(){
        //For Mock
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        sut = SignupWebService(urlString: "")
        
        //For waiting on the async call
        let expectation = self.expectation(description: "Expectation when Invalid URL is Passed")
        
        //Act
        sut.signup(withFormModel : signupFormRequestModel){ (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "No URL found Error should have been passed")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenUrlRequestFails_ReturnsErrorMessageDescription(){
        //For Mock
        MockURLProtocol.error = SignupError.failedUrlRequest
        
        //For waiting on the async call
        let expectation = self.expectation(description: "Signup Web Service Response with different JSON Structure Expectation")
        
        //Act
        sut.signup(withFormModel : signupFormRequestModel){ (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignupError.failedUrlRequest)
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
        
        
    }

}
