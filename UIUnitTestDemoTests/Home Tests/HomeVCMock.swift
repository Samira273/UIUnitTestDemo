//
//  HomeVCMock.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import Foundation
@testable import UIUnitTestDemo

class HomeVCMock: HomeVC {
    private(set) var dataLoadedHasBeenCalled: Bool = false
    private(set) var showsErrorMessageHasBeenCalled: Bool = false
    override func dataLoaded() {
        dataLoadedHasBeenCalled = true
    }
    override func showError(with message: String) {
        showsErrorMessageHasBeenCalled = true
    }
}
