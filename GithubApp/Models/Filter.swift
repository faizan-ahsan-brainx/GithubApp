//
//  Filter.swift
//  GithubApp
//
//  Created by BrainX on 10/06/2022.
//

import Foundation
struct Filter {
    // MARK: Instance Properties
    var languageName: Languages
    var isSelected: Bool
    
}

    // MARK: Languages Enum
enum Languages: String {
    case python = "Python"
    case interiorPainting = "Interior Painting"
    case electrician = "Electrician"
    case inappropriateClientBehavior = "Inappropriate client behavior"
    case carpenter = "Carpenter"
    case houseCleaning = "House Cleaning"
    case gardener = "Gardener"
}
