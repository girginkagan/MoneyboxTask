//
//  HomeTests.swift
//  MoneyBoxTaskUITests
//
//  Created by Kagan Girgin on 7/31/22.
//

import XCTest

class HomeTests: XCTestCase {
    func testHome() throws {
        let app = XCUIApplication()
        app.launchArguments.append("loggedout_uitesting")
        app.launch()
        
        let tfMail = app.textFields.firstMatch
        let tfPassword = app.secureTextFields.firstMatch
        
        tfMail.tap()
        tfMail.typeText("test+ios2@moneyboxapp.com")
        app.toolbars.firstMatch.buttons.firstMatch.tap()
        
        tfPassword.tap()
        tfPassword.typeText("P455word12")
        app.toolbars.firstMatch.buttons.firstMatch.tap()
        
        app.buttons["btnLogin"].tap()
        
        if XCUIApplication().tables.firstMatch.waitForExistence(timeout: 10000) {
            XCUIApplication().tables.firstMatch.swipeUp()
            XCUIApplication().tables.firstMatch.swipeDown()
            
            XCUIApplication().tables.cells["ProductTableViewCell"].firstMatch.tap()
        }
    }
}
