//
//  FilterDelegate.swift
//  GithubApp
//
//  Created by BrainX on 14/06/2022.
//

import Foundation

// MARK: - Protocol
protocol FilterDelegate {
    func getSelectedFilters(filters: [Filter])
}
