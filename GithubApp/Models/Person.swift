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
    var languageUrl: Languages = {
        let languageData = [Languages.python, Languages.interiorPainting, Languages.electrician, Languages.inappropriateClientBehavior, Languages.gardener,Languages.carpenter,Languages.houseCleaning]
        let randomInt = Int.random(in: 0...6)
        return languageData[randomInt]
    }()
    
    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case description
    }
}


