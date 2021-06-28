//
//  HomeVC.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    let viewModel = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        viewModel.viewDidLoad()
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        homeTableView.estimatedRowHeight = 44
        homeTableView.delegate = self
        homeTableView.dataSource = self
        viewModel.dataLoaded = {
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.configureCell(with: viewModel.titles[indexPath.row])
        return cell
    }
    
}
