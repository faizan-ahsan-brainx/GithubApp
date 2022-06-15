//
//  Person.swift
//  GithubApp
//
//  Created by BrainX on 07/06/2022.
//

import Foundation

// MARK: - Structure of Person
struct Person: Decodable {
    var name: String?
    var owner: Owner?
    var description: String?
    var languageUrl: languages = {
        //        let languagesData = ["Python","Interior Painting","Electrician","Inappropriate client behavior","Gardener","Carpenter","House Cleaning"]
        let randomInt = Int.random(in: 0...6)
        return randomInt == 0 ? .Python :
        randomInt == 1 ? .InteriorPainting :
        randomInt == 2 ? .Electrician :
        randomInt == 3 ? .InappropriateClientBehavior :
        randomInt == 4 ? .Gardener :
        randomInt == 5 ? .Carpenter :
        randomInt == 6 ? .HouseCleaning : .Python
    }()
    
    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case description
        //case languageUrl = "languages_url"
    }
}


