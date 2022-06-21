//
//  FilterView.swift
//  GithubApp
//
//  Created by BrainX on 09/06/2022.
//

import UIKit

class FilterView: UIView {

    // MARK: IB Outlets
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
