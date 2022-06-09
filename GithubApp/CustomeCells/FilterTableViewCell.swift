//
//  FilterTableViewCell.swift
//  GithubApp
//
//  Created by BrainX on 09/06/2022.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var languageLabel: PaddingLabel!
    @IBOutlet weak var radioButton: CheckBox!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        languageLabel.font = UIFont(name: "Gilroy", size: 17)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
