//
//  FilterViewModel.swift
//  GithubApp
//
//  Created by BrainX on 21/06/2022.
//

import Foundation
import UIKit

class FilterViewModel {
    
    // MARK: -Instance Properties
    var filterData :[Filter] = []
    let checkedImage = UIImage(named: "check")
    let uncheckedImage = UIImage(named: "uncheck")
    
    // MARK: - Functions
    func configureFilterData(_ filterData: [Filter]) {
        self.filterData = filterData
    }
    
    func clearFilter() {
        filterData.indices.forEach {
            filterData[$0].isSelected = false
        }
        for index in 0..<filterData.count {
            filterData[index].isSelected = false
        }
        
    }
    
    func changeButtonImage(tagNo: Int,sender: UIButton) {
        if !filterData[tagNo].isSelected {
            sender.setImage(checkedImage, for: UIControl.State.normal)
        } else {
            sender.setImage(uncheckedImage, for: UIControl.State.normal)
        }
        filterData[tagNo].isSelected.toggle()
        }
}

