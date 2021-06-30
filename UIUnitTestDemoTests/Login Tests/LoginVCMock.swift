//
//  LoginVCMock.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import Foundation
@testable import UIUnitTestDemo

class LoginVCMock: LoginVC {
    private(set) var loginSussessBeenCalled: Bool = false
    private(set) var showErrorHasBeenCalled: Bool = false
    
    override func loginFailed(with message: String) {
        showErrorHasBeenCalled = true
    }
    
    override func loginSuccesseded() {
        loginSussessBeenCalled = true
    }
}
