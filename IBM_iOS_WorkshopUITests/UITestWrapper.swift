//
//  LoginViewControllerUITests.swift
//  IBM_iOS_WorkshopUITests
//
//  Created by Matas Paulius Dregva on 10/06/2024.
//

import XCTest
import IBM_Workshop_UI_Test

//fix shared keychain bug
final class UITestWrapper: XCTestCase {
    func testRunTests(){
        UITestRunner.runAllTests()
    }
}

