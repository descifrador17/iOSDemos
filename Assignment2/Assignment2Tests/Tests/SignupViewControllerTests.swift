//
//  SignupViewControllerTests.swift
//  Assignment2Tests
//
//  Created by Dayal, Utkarsh on 09/06/21.
//

import XCTest
@testable import Assignment2

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.sut = self.storyboard.instantiateViewController(identifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.storyboard = nil
        self.sut = nil
    }
    
    func testSignupViewController_WhenCreated_HasRequiredFieldsEmpty(){
        XCTAssertEqual(sut.firstNameTextField.text, "")
        XCTAssertEqual(sut.lastNameTextField.text, "")
        XCTAssertEqual(sut.phoneNumberTextField.text, "")
        XCTAssertEqual(sut.addressTextField.text, "")
        XCTAssertEqual(sut.emailTextField.text, "")
        XCTAssertEqual(sut.passwordTextField.text, "")
        XCTAssertEqual(sut.repeatPasswordTextField.text, "")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup Button Outlet not connected")
        
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside),"No Action provided for signup Button")
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first,"onSaveClicked:")
    }
    
    func testSignupViewController_WhenSignupButtonPressed_invokeSignupProcess(){
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: MockFormModelValidator(), delegate: MockSignupViewDelegate())
        
        sut.signupPresenter = mockSignupPresenter
        
        sut.signupButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(mockSignupPresenter.isSignupProcessCalled,"Process signup should have been called")
    }
    
}
