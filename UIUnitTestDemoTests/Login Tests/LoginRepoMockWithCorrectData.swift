//
//  LoginRepoMock.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import Foundation
@testable import UIUnitTestDemo

class LoginRepoMockWithCorrectData: LoginReposatory {
    override func login(with email: String, and password: String, completion: @escaping ((Bool, String?, LoginModel?) -> Void)) {
        completion(true, nil, LoginModel(fromDictionary: [:]))
    }
}
