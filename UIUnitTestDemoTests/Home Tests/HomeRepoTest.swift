//
//  HomeRepoTest.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import XCTest
@testable import UIUnitTestDemo

class HomeRepoTest: XCTestCase {
    private var repo: HomeReposatory!
    
    func testLoadData() {
        repo = HomeReposatory()
        //when
        let expectation = expectation(description: "RepositoryExpectation") //setting expectation to be fullfilled
        repo.loadData { model in //get products from protocol method
            //then
            XCTAssertNotNil(model) //test model isn't nil
            XCTAssertNotNil(model?.homeDataArray.count)
            XCTAssertTrue( model?.homeDataArray.count ?? 0 > 0) //test if titles count is greater than 0
            expectation.fulfill() //fullfill the expectation and end waiting
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
