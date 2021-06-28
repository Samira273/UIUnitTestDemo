//
//  HomeTableViewCell.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with title: String) {
        self.titleLabel.text = title
    }
    
}
