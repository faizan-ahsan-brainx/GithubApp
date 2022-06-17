//
//  FilterTableViewCell.swift
//  GithubApp
//
//  Created by BrainX on 09/06/2022.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var languageLabel: PaddingLabel!
    @IBOutlet weak var radioButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        languageLabel.font = UIFont(name: "Gilroy", size: 17)
    }
}
