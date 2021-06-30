//
//  LoginRepoTest.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import XCTest
@testable import UIUnitTestDemo

class LoginRepoTest: XCTestCase {

    private var loginRepository: LoginReposatory!
    
    func testLogin() {
        //given
        loginRepository = LoginReposatory() //inistantiate repo
        
        //when
        let expectation = expectation(description: "Repository Expectation") //setting expectation to be fullfilled
        loginRepository.login(with: "user@mailinator.com", and: "12345678") { isSuccess, message, model  in
            XCTAssertTrue(isSuccess)
            XCTAssertNotNil(model)
            XCTAssertNil(message)
            expectation.fulfill()
        }

    //then
        waitForExpectations(timeout: 10) { error in
            //await for 10 secs, while the time out that produces error is 3 sec
            if let error = error {
                XCTFail("Repository finish() not called: \(error)")
            }
        }
    }

}
