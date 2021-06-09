//
//  FormPresenterTests.swift
//  Assignment2Tests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import XCTest
@testable import Assignment2

class FormPresenterTests: XCTestCase {

    var sut: FormPresenter!
    var mockFormModelValidator: MockFormModelValidator!
    var formModel: FormModel!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.formModel = FormModel(firstName: "Utkarsh", lastName: "Dayal", phoneNumber: "9898989898", address: "A4 Kailashpuram Delapeer bareilly", email: "utkarshdayal.17@gmail.com", password: "hello", repeatPassword: "hello")
        self.mockFormModelValidator = MockFormModelValidator()
        self.mockSignupViewDelegate = MockSignupViewDelegate()
        self.sut = FormPresenter(formModelValidator: self.mockFormModelValidator, delegate: mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.sut = nil
        self.mockFormModelValidator = nil
        self.mockSignupViewDelegate = nil
        self.formModel = nil
    }

    //MARK: - TESTS FOR SIGNUP PRESENTER
    func testFormPresenter_WhenInformationProvided_WillValidateEachProperty(){
        
        sut.processSignup(formModel: self.formModel)
        
        XCTAssertTrue(mockFormModelValidator.isfirstNameValid)
        XCTAssertTrue(mockFormModelValidator.isLastnameValid)
        XCTAssertTrue(mockFormModelValidator.isPhoneNumberValid)
        XCTAssertTrue(mockFormModelValidator.isEmailValid)
        XCTAssertTrue(mockFormModelValidator.doesPasswordMatch)
        
    }
    
    func testFormPresenter_WhenValidInfoProvided_ShouldCallSuccessOnViewDelegate(){
        let myExpectation = expectation(description: "Expectation for calling successfulSignup() on View Delegate")
        mockSignupViewDelegate.expectation = myExpectation
        //mockFormModelValidator.shouldReturnError = true
        
        sut.processSignup(formModel: self.formModel)

        
        XCTAssertTrue(mockSignupViewDelegate.isSuccessfulSignup,"successfulSignup() should have been called in delegate")
        
        self.wait(for: [myExpectation], timeout: 5)
    }

    func testFormPresenter_WhenInvalidInfoProvided_ShouldCallErrorOnViewDelegate(){
        let myExpectation = expectation(description: "Expectation for calling errorHandler() on View Delegate")
        mockSignupViewDelegate.expectation = myExpectation
        mockFormModelValidator.shouldReturnError = true
        
        sut.processSignup(formModel: self.formModel)

        XCTAssertTrue(mockSignupViewDelegate.isUnsuccessfulSignup,"ErrorHandler() should have been called in delegate")
        XCTAssertNotNil(mockSignupViewDelegate.error)
        
        self.wait(for: [myExpectation], timeout: 5)
    }
}
