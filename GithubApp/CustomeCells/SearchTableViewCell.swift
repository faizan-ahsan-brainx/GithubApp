//
//  SearchTableViewCell.swift
//  GithubApp
//
//  Created by BrainX on 07/06/2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    // MARK: - IB Outlets
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroungImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 30
        nameLabel.font = UIFont(name: "Gilroy", size: 17)
        configureOuterView()
        configureLabels()
    }
    
    // MARK: - Functions For Configurations
    func configureOuterView() {
        outerView.layer.cornerRadius = 20
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor.lightGray.cgColor
        
        personImage.layer.borderWidth = 1
        personImage.layer.borderColor = UIColor.white.cgColor
        personImage.layer.cornerRadius = 10.0
        personImage.clipsToBounds = true
        personImage.layer.masksToBounds = true
    }

    func configureLabels() {
        descriptionLabel.font = UIFont(name: "Gilroy", size: 17)
        nameLabel.font = UIFont(name: "Gilroy", size: 17)
        languageLabel.layer.cornerRadius = 5
        languageLabel.clipsToBounds = true
        languageLabel.text = "Python"
        languageLabel.font = UIFont(name: "Gilroy", size: 17)
    }
}
