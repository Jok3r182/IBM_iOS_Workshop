//
//  IBM_iOS_WorkshopUITestsLaunchTests.swift
//  IBM_iOS_WorkshopUITests
//
//  Created by Matas Paulius Drėgva on 10/04/2024.
//

import XCTest

final class IBM_iOS_WorkshopUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
