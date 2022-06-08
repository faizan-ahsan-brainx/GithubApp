//
//  Owner.swift
//  GithubApp
//
//  Created by BrainX on 08/06/2022.
//

import Foundation

// MARK: - Structure of Owner
struct Owner: Decodable {
    var avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
      }
}
