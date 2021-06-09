//
//  SignupViewControllerTests.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import XCTest
@testable import UnitTestDemoApp

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.storyboard = nil
        self.sut = nil
    }

    //MARK: - Signup View Controller Tests
    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty(){
        XCTAssertEqual(sut.firstNameTextField.text, "")
        XCTAssertEqual(sut.lastNameTextField.text, "")
        XCTAssertEqual(sut.emailTextField.text, "")
        XCTAssertEqual(sut.phoneNumberTextField.text, "")
        XCTAssertEqual(sut.passwordTextField.text, "")
        XCTAssertEqual(sut.repeatPasswordTextField.text, "")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup Button Outlet not connected")
        
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside),"No Action provided for signup Button")
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first,"signupButtonPressed:")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_invokesSignupProcess(){
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: MockSignupModelValidator(), signupWebService: MockSignupWebService(), delegate: MockSignupViewDelegate())
        
        sut.signupPresenter = mockSignupPresenter
        
        sut.signupButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(mockSignupPresenter.isProcessUserSignupCalled,"Process signup should have been called")
        
    }

}
