//
//  FormModelValidatorTests.swift
//  Assignment2Tests
//
//  Created by Dayal, Utkarsh on 08/06/21.
//

import XCTest
@testable import Assignment2

class FormModelValidatorTests: XCTestCase {

    var sut: FormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = FormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    //MARK: - TESTS FOR FIRST NAME
    func testFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        let isValidFirstname = sut.isNameValid(name: "Utkarsh")
        XCTAssertTrue(isValidFirstname, "isValidName() should have returned TRUE")
    }
    
    func testFormModelValidator_WhenSmallFirstNameProvided_ShouldReturnFalse(){
        let isValidFirstname = sut.isNameValid(name: "Ut")
        XCTAssertFalse(isValidFirstname, "isValidName() should have returned FALSE as First name length is less than 3 characters")
    }
    
    func testFormModelValidator_WhenLongFirstNameProvided_ShouldReturnFalse(){
        let isValidFirstname = sut.isNameValid(name: "UtkarshUtkarshUtkarsh")
        XCTAssertFalse(isValidFirstname, "isValidName() should have returned FALSE as First Name length is more than 15 characters")
    }
    
    func testFormModelValidator_WhenNoFirstNameProvided_ShouldReturnFalse(){
        let isValidFirstname = sut.isNameValid(name: "")
        XCTAssertFalse(isValidFirstname, "isValidName() should have returned FALSE as no name is provided")
    }
    
    //MARK: - TESTS FOR LAST NAME
    func testFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue(){
        let isValidLastName = sut.isNameValid(name: "Dayal")
        XCTAssertTrue(isValidLastName, "isValidName() should have returned TRUE")
    }
    
    func testFormModelValidator_WhenSmallLastNameProvided_ShouldReturnFalse(){
        let isValidLastName = sut.isNameValid(name: "Da")
        XCTAssertFalse(isValidLastName, "isValidName() should have returned FALSE as First name length is less than 3 characters")
    }
    
    func testFormModelValidator_WhenLongLastNameProvided_ShouldReturnFalse(){
        let isValidLastName = sut.isNameValid(name: "DayalDayalDayalDayal")
        XCTAssertFalse(isValidLastName, "isValidName() should have returned FALSE as First Name length is more than 15 characters")
    }
    
    func testFormModelValidator_WhenNoLastNameProvided_ShouldReturnFalse(){
        let isValidLastName = sut.isNameValid(name: "")
        XCTAssertFalse(isValidLastName, "isValidName() should have returned FALSE as no name is provided")
    }
    
    //MARK: - TESTS FOR PHONE NUMBER
    func testFormModelValidator_WhenValidPhoneNumberProvided_ShouldReturnTrue(){
        let isValidPhoneNumber = sut.isPhoneNumberValid(phoneNumber: "1234567890")
        XCTAssertTrue(isValidPhoneNumber, "isPhoneNumberValid() should have returned TRUE")
    }
    
    func testFormModelValidator_WhenSmallPhoneNumberProvided_ShouldReturnFalse(){
        let isValidPhoneNumber = sut.isPhoneNumberValid(phoneNumber: "12345")
        XCTAssertFalse(isValidPhoneNumber, "isPhoneNumberValid() should have returned FALSE for phone number less than 10 digits")
    }
    
    func testFormModelValidator_WhenLongPhoneNumberProvided_ShouldReturnFalse(){
        let isValidPhoneNumber = sut.isPhoneNumberValid(phoneNumber: "12345678900000")
        XCTAssertFalse(isValidPhoneNumber, "isPhoneNumberValid() should have returned FALSE for phone number more than 10 digits")
    }
    
    func testFormModelValidator_WhenNoPhoneNumberProvided_ShouldReturnFalse(){
        let isValidPhoneNumber = sut.isPhoneNumberValid(phoneNumber: "")
        XCTAssertFalse(isValidPhoneNumber, "isPhoneNumberValid() should have returned FALSE for no phone number")
    }
    
    func testFormModelValidator_WhenCharacterProvided_ShouldReturnFalse(){
        let isValidPhoneNumber = sut.isPhoneNumberValid(phoneNumber: "9897aabs23")
        XCTAssertFalse(isValidPhoneNumber, "isPhoneNumberValid() should have returned FALSE for phone number with invalid characters")
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
