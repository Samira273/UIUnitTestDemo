//
//  HomeVM.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import Foundation
class HomeVM: NSObject {
    
    var repo: HomeReposatory
    var homeModel = HomeModel()
    
    init (reposatory: HomeReposatory) {
        self.repo = reposatory
    }
    
    var dataLoaded: (() -> Void)?
    var showError: ((String) -> Void)?
    
    func viewDidLoad() {
        repo.loadData(completion: { model in
            guard let model = model else {
                self.showError?("Loading data failed")
                return
            }
            self.homeModel = model
            self.dataLoaded?()
        })
    }
}
