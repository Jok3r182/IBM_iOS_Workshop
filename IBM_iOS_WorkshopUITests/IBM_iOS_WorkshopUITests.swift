//
//  IBM_iOS_WorkshopUITests.swift
//  IBM_iOS_WorkshopUITests
//
//  Created by Matas Paulius Drėgva on 10/04/2024.
//

import XCTest

final class IBM_iOS_WorkshopUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        app = nil
        try super.tearDownWithError()
    }
    
    func testViewControllerInitialization() {
        let button = app.buttons["showButton"]
        XCTAssertTrue(button.exists)
    }
}
