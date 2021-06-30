//
//  LoginTest.swift
//  UIUnitTestDemoUITests
//
//  Created by Samira Marassy on 30/06/2021.
//

import XCTest


class LoginTest: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLoginSuccess() throws {
        
        
        let app = XCUIApplication()
        let emailTextField = app.textFields["email"]
        emailTextField.tap()
        emailTextField.tap()
        emailTextField.tap()
        emailTextField.tap()
        emailTextField.tap()
        emailTextField.tap()
        emailTextField.tap()
        emailTextField.tap()
        emailTextField.tap()
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        loginButton.tap()
        loginButton.tap()
        loginButton.tap()
        loginButton.tap()
        loginButton.tap()
        loginButton.tap()
        loginButton.tap()
        loginButton.tap()
        
    }
    
    func testLoginFailure() throws {
        //given
        let passwordSecureTextField = app.secureTextFields["password"]
        let emailTextField = app.textFields["email"]
        let loginButton = app.buttons["Login"]
        
        XCTAssertTrue(passwordSecureTextField.exists)
        XCTAssertTrue(emailTextField.exists)
        XCTAssertTrue(loginButton.exists)
        emailTextField.tap()
        emailTextField.typeText("user@mailinator.com")
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345678")
        
        loginButton.tap()
        
    }

}
