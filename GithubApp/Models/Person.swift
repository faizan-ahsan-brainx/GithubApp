//
//  Person.swift
//  GithubApp
//
//  Created by BrainX on 07/06/2022.
//

import Foundation
import ObjectMapper

struct Person: Decodable {
    var name: String?
    var owner: Owner?
    var description: String?
    var languageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case description
        case languageUrl = "languages_url"
      }
}

struct Owner: Decodable {
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
      }
}

