//
//  HomeVMTest.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import XCTest
@testable import UIUnitTestDemo

class HomeVMTest: XCTestCase {
    
    private var homeVM: HomeVM!
    private var homeVCMock: HomeVCMock!
    
    func testHomeVMWithData() {
        homeVCMock = HomeVCMock()
        homeVM = HomeVM(reposatory: HomeRepoMockWithData())
        homeVCMock.viewModel = homeVM
        homeVM.viewDidLoad()
        XCTAssertTrue(homeVCMock.dataLoadedHasBeenCalled)
        XCTAssertFalse(homeVCMock.showsErrorMessageHasBeenCalled)
    }
    
    func testHomeVMWithoutData() {
        homeVCMock = HomeVCMock()
        homeVM = HomeVM(reposatory: HomeRepoMockWithoutData())
        homeVCMock.viewModel = homeVM
        homeVM.viewDidLoad()
        XCTAssertFalse(homeVCMock.dataLoadedHasBeenCalled)
        XCTAssertTrue(homeVCMock.showsErrorMessageHasBeenCalled)
    }


}
