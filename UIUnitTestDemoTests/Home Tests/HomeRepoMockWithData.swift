//
//  HomeRepoMockWithData.swift
//  UIUnitTestDemoTests
//
//  Created by Samira Marassy on 30/06/2021.
//

import Foundation
@testable import UIUnitTestDemo

class HomeRepoMockWithData: HomeReposatory {
    override func loadData(completion: @escaping ((HomeModel?) -> Void)) {
        completion(HomeModel(homeDataArray: ["zaza", "smsm"]))
    }
}
