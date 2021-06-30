//
//  LoginRepoMockWithInCorrectData.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import Foundation
@testable import UIUnitTestDemo

class LoginRepoMockWithInCorrectData: LoginReposatory {
    override func login(with email: String, and password: String, completion: @escaping ((Bool, String?, LoginModel?) -> Void)) {
        completion(false, "login failed", nil)
    }
}
