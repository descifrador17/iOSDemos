//
//  SignUpFormModelValidator.swift
//  UnitTestDemoAppTests
//
//  Created by Dayal, Utkarsh on 03/06/21.
//

import XCTest
@testable import UnitTestDemoApp

class SignUpFormModelValidatorTests: XCTestCase {

    var sut : SignUpFormModelValidator!
    
    override func setUpWithError() throws {
        sut = SignUpFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - TESTS FOR FIRST NAME
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        //Arrange

        //Act
        let isFirstNameValid = sut.isNameValid(name: "helo")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenVeryShortFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isNameValid(name: "ss")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenVeryLongFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isNameValid(name: "1234567890abcdef")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE coz the first name has length more than 15")
    }
    
    // MARK: - TESTS FOR LAST NAME
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue(){
        //Arrange

        //Act
        let isFirstNameValid = sut.isNameValid(name: "helo")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenVeryShortLastNameProvided_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isNameValid(name: "ss")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenVeryLongLasttNameProvided_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isNameValid(name: "1234567890abcdef")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE coz the first name has length more than 15")
    }

    //MARK: - TESTS FOR PHONE NUMBER
    func testSignupFormModelValidator_WhenValidPhoneNumberProvided_ShouldReturnTrue(){
        let isPhoneNumberValid = sut.isPhoneNumberValid(phoneNumber: "9897989798")
        XCTAssertTrue(isPhoneNumberValid, "The isPhoneNumberValid() should have returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenSmallPhoneNumberProvided_ShouldReturnFalse(){
        let isPhoneNumberValid = sut.isPhoneNumberValid(phoneNumber: "9897988")
        XCTAssertFalse(isPhoneNumberValid, "The isPhoneNumberValid() should have returned FALSE for Small Phone Number")
    }
    
    func testSignupFormModelValidator_WhenLongPhoneNumberProvided_ShouldReturnFalse(){
        let isPhoneNumberValid = sut.isPhoneNumberValid(phoneNumber: "989798979896")
        XCTAssertFalse(isPhoneNumberValid, "The isPhoneNumberValid() should have returned FALSE for Long Phone Number")
    }
    
    func testsignupFormModelValidator_WhenOtherCharacterProvided_ShouldReturnFalse(){
        let isPhoneNumberValid = sut.isPhoneNumberValid(phoneNumber: "9897989a98")
        XCTAssertFalse(isPhoneNumberValid, "The isPhoneNumberValid() should have returned FALSE for a Phone Number with alphabet")
    }
    
    //MARK: - TESTS FOR EMAIL
    func testSignupFormModelvalidator_WhenValidEmailProvided_ShouldReturnTrue(){
        let isEmailValid = sut.isEmailValid(email: "utkarshdayal.17@gmail.com")
        XCTAssertTrue(isEmailValid,"The isEmailValid() should have returned TRUE")
    }
    
    func testSignupFormModelvalidator_WhenSmallEmailProvided_ShouldReturnTrue(){
        let isEmailValid = sut.isEmailValid(email: "a@gmail.com")
        XCTAssertFalse(isEmailValid,"The isEmailValid() should have returned FALSE for small email")
    }
    
    func testSignupFormModelvalidator_WhenBadFormatEmailProvided_ShouldReturnTrue(){
        let isEmailValid = sut.isEmailValid(email: "utkarshdayal.17gmail.com")
        XCTAssertFalse(isEmailValid,"The isEmailValid() should have returned FALSE for Email with wrong format")
    }
    
    //MARK: - TESTS FOR PASSWORD AND REPEAT PASSWORD
    func testSignupFormModelValidator_WhenPasswordMatchesRepeatPassword_ShouldReturnTrue(){
        let doesPasswordMatch = sut.doesPasswordMatch(password: "abc@123)(done", repeatPassword: "abc@123)(done")
        XCTAssertTrue(doesPasswordMatch, "the doesPasswordMatch() should have returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenPasswordDoesNotMatchRepeatPassword_ShouldReturnFalse(){
        let doesPasswordMatch = sut.doesPasswordMatch(password: "abc@123)(done", repeatPassword: "abc@123")
        XCTAssertFalse(doesPasswordMatch, "the doesPasswordMatch() should have returned FALSE when password does not match")
    }
    
    func testSignupFormModelValidator_WhenPasswordNotProvided_ShouldReturnFalse(){
        let doesPasswordMatch = sut.doesPasswordMatch(password: "", repeatPassword: "abc@123)(done")
        XCTAssertFalse(doesPasswordMatch, "the doesPasswordMatch() should have returned FALSE when password not provided")
    }
    
    func testSignupFormModelValidator_WhenRepeatPasswordNotProvided_ShouldReturnFalse(){
        let doesPasswordMatch = sut.doesPasswordMatch(password: "abc@123)(done", repeatPassword: "")
        XCTAssertFalse(doesPasswordMatch, "the doesPasswordMatch() should have returned FALSE when repeat password not provided")
    }
    
    func testSignupFormModelValidator_WhenPassAndRepeatPassNotProvided_ShouldReturnFalse(){
        let doesPasswordMatch = sut.doesPasswordMatch(password: "", repeatPassword: "")
        XCTAssertFalse(doesPasswordMatch, "the doesPasswordMatch() should have returned FALSE when password and repeat password not provided")
    }
}
