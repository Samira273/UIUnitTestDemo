//
//  HomeModel.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import Foundation
struct HomeModel {
    var homeDataArray: [String] = []
}

extension Constants {
    
    struct APIHome {
        static let APIScheme = "https"
        static let APIHost = "smea-pc.ibtikar.sa"
        static let APIPath = "/api/dashboard/mobile/subjects"
    }
}
