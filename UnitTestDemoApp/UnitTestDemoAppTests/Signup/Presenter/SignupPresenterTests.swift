//
//  SignupPresenterTests.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import XCTest
@testable import UnitTestDemoApp

class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator : MockSignupModelValidator!
    var mockSignupWebService : MockSignupWebService!
    var sut : SignupPresenter!
    var mockSignupViewDelegate : MockSignupViewDelegate!


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        signupFormModel = SignupFormModel(firstName: "Utkarsh", lastName: "Dayal", email: "utkarshdayal.17@gmail.com", phoneNumber: "9897979797", password: "Hello", repeatPassword: "Hello")
        
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, signupWebService: mockSignupWebService, delegate: mockSignupViewDelegate)
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty(){
        sut.processUserSignup(formModel: signupFormModel)
        
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValid,"First name should have been valid")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValid,"Last name should have been valid")
        XCTAssertTrue(mockSignupModelValidator.isPhoneNumberValid,"Phone Number should have been valid")
        XCTAssertTrue(mockSignupModelValidator.isEmailValid,"Email should have been valid")
        XCTAssertTrue(mockSignupModelValidator.doesPasswordMatch,"Passwords should have matched")
        
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod(){
        sut.processUserSignup(formModel: signupFormModel)
        
        XCTAssertTrue(mockSignupWebService.isSignupCalled)
        
        
    }
    
    
    func testSignupPresenter_WhenSignupSuccessful_CallsSuccessOnViewDelegate(){
        let myExpectation = expectation(description: "Expected SuccessfulSignup() to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        sut.processUserSignup(formModel: self.signupFormModel)
        
        self.wait(for: [myExpectation], timeout: 5)
    }

}
