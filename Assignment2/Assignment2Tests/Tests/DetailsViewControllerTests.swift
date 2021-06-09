//
//  DetailsViewControllerTests.swift
//  Assignment2Tests
//
//  Created by Dayal, Utkarsh on 09/06/21.
//

import XCTest
@testable import Assignment2

class DetailsViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: DetailsViewController!
    
    override func setUpWithError() throws {
        
        self.storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.sut = storyboard.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        self.sut = nil
        self.storyboard = nil
    }
    
    func testDetailsViewController_WhenCreated_HasRequiredLabels() throws{
        let _: UILabel = try XCTUnwrap(sut.firstNameLabel, "First name Label Outlet not connected")
        let _: UILabel = try XCTUnwrap(sut.lastNameLabel, "Last name label Outlet not connected")
        let _: UILabel = try XCTUnwrap(sut.phoneLabel, "Phone label Outlet not connected")
        let _: UILabel = try XCTUnwrap(sut.addressLabel, "Address label Outlet not connected")
        let _: UILabel = try XCTUnwrap(sut.emailLabel, "Email label Outlet not connected")
    }
    

}
