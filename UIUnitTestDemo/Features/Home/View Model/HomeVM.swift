//
//  HomeVM.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import Foundation
class HomeVM: NSObject {
    var model = HomeModel()
    var titles: [String] = []
    var dataLoaded: (() -> Void)?
    func viewDidLoad() {
        model.loadData(completion: { data in
            self.titles = data
            self.dataLoaded?()
        })
    }
}
