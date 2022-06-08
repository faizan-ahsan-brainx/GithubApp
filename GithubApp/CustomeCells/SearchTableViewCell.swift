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
        configureOuterView()
        configurePersonImage()
        configureLanguageLabel()
    }
    
    // MARK: - Functions For Configurations
    func configureOuterView(){
        outerView.layer.cornerRadius = 20
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configureLanguageLabel(){
        languageLabel.layer.cornerRadius = 10
        languageLabel.clipsToBounds = true
        languageLabel.text = "Python"
    }
    
    func configurePersonImage(){
        personImage.layer.cornerRadius = 10.0
        personImage.clipsToBounds = true
        personImage.layer.masksToBounds = true
    }
}
