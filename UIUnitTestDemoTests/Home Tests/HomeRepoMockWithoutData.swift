//
//  HomeRepoMockWithoutData.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import Foundation
@testable import UIUnitTestDemo

class HomeRepoMockWithoutData: HomeReposatory {
    override func loadData(completion: @escaping ((HomeModel?) -> Void)) {
        completion(nil)
    }
}
