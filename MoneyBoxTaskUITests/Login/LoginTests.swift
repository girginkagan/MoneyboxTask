//
//  LoginTests.swift
//  MoneyBoxTaskUITests
//
//  Created by Kagan Girgin on 7/31/22.
//

import XCTest

class LoginTests: XCTestCase {
    func testLoginWrongPassword() throws {
        let app = XCUIApplication()
        app.launchArguments.append("loggedout_uitesting")
        app.launch()
        
        let tfMail = app.textFields.firstMatch
        let tfPassword = app.secureTextFields.firstMatch
        
        tfMail.tap()
        tfMail.typeText("test+ios2@moneyboxapp.com")
        app.toolbars.firstMatch.buttons.firstMatch.tap()
        
        tfPassword.tap()
        tfPassword.typeText("P455")
        app.toolbars.firstMatch.buttons.firstMatch.tap()
        
        app.buttons["btnLogin"].tap()
        
        XCTAssertTrue(app.alerts.count > 0)
    }
    
    func testLoginWrongMail() throws {
        let app = XCUIApplication()
        app.launchArguments.append("loggedout_uitesting")
        app.launch()
        
        let tfMail = app.textFields.firstMatch
        let tfPassword = app.secureTextFields.firstMatch
        
        tfMail.tap()
        tfMail.typeText("test+ios2moneyboxapp.com")
        app.toolbars.firstMatch.buttons.firstMatch.tap()
        
        tfPassword.tap()
        tfPassword.typeText("P455word12")
        app.toolbars.firstMatch.buttons.firstMatch.tap()
        
        app.buttons["btnLogin"].tap()
        
        XCTAssertTrue(app.alerts.count > 0)
    }
    
    func testLogin() throws {
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
        
        XCTAssertTrue(app.alerts.count == 0)
    }
}
