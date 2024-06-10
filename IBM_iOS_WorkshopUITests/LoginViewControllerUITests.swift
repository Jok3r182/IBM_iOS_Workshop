//
//  LoginViewControllerUITests.swift
//  IBM_iOS_WorkshopUITests
//
//  Created by Matas Paulius Dregva on 10/06/2024.
//

import XCTest

final class LoginViewControllerUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testUsernameLabel() {
        let usernameLabel = app.staticTexts["usernameUILabel"]
        XCTAssertTrue(usernameLabel.exists, "Username label exists")
        XCTAssertEqual(usernameLabel.label, "Username", "Username label contains a 'Username' text")
    }
    
    func testUsernameTextfield(){
        let usernameTextfield = app.textFields["usernameUITextField"]
        XCTAssertTrue(usernameTextfield.exists, "Username text field exists")
        XCTAssertEqual(usernameTextfield.placeholderValue, "Username", "Username textfield contains a 'Username' placeholder")
    }
    
    func testUsernameLabelAboveTextfield(){
        let usernameLabel = app.staticTexts["usernameUILabel"]
        let usernameTextfield = app.textFields["usernameUITextField"]
        
        let isUsernameLabelAboveTextField = usernameLabel.frame.maxY < usernameTextfield.frame.minY
        
        XCTAssertTrue(isUsernameLabelAboveTextField, "Username label is positioned above the username text field")
    }
}
