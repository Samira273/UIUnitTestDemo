//
//  LoginVMTest.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import XCTest
@testable import UIUnitTestDemo

class LoginVMTest: XCTestCase {

    private var loginVM: LoginVM!
    private var loginVCMock: LoginVCMock!
    
    func testLoginVMWithCorrectData() {
        loginVCMock = LoginVCMock()
        loginVM = LoginVM(repo: LoginRepoMockWithCorrectData())
        loginVCMock.viewModel = loginVM
        loginVM.loginTapped(with: "user@mailinator.com", and: "12345678")
        XCTAssertTrue(loginVCMock.loginSussessBeenCalled)
        XCTAssertFalse(loginVCMock.showErrorHasBeenCalled)
    }
    
    func testLoginVMWithInCorrectData() {
        loginVCMock = LoginVCMock()
        loginVM = LoginVM(repo: LoginRepoMockWithInCorrectData())
        loginVCMock.viewModel = loginVM
        loginVM.loginTapped(with: "zaza@gm.com", and: "12345678")
        XCTAssertFalse(loginVCMock.loginSussessBeenCalled)
        XCTAssertTrue(loginVCMock.showErrorHasBeenCalled)
    }
    
    func testLoginVMWithInvalidData() {
        loginVCMock = LoginVCMock()
        loginVM = LoginVM(repo: LoginReposatory())
        loginVCMock.viewModel = loginVM
        loginVM.loginTapped(with: "zaza", and: "zmzm")
        XCTAssertFalse(loginVCMock.loginSussessBeenCalled)
        XCTAssertTrue(loginVCMock.showErrorHasBeenCalled)
    }
}
