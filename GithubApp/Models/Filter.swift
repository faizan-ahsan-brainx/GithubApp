//
//  Filter.swift
//  GithubApp
//
//  Created by BrainX on 10/06/2022.
//

import Foundation
struct Filter{
    // MARK: Instance Properties
    var languageName: languages
    var isSelected: Bool
}

    // MARK: Languages Enum
enum languages: String {
    case Python = "Python"
    case InteriorPainting = "Interior Painting"
    case Electrician = "Electrician"
    case InappropriateClientBehavior = "Inappropriate client behavior"
    case Carpenter = "Carpenter"
    case HouseCleaning = "House Cleaning"
    case Gardener = "Gardener"
}
