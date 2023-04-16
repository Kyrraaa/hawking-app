//
//  Player.swift
//  hawking-app
//
//  Created by Laurine Pereira on 12/04/2023.
//

import Foundation

struct Player: Identifiable, Decodable {
    let id: Int
    let uuid: String
    let username: String
    var authorizedBlocks: [AuthorizedBlock]?
    let createdAt: String
    let lastLoginAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case uuid
        case username
        case authorizedBlocks = "authorized_blocks"
        case createdAt = "created_at"
        case lastLoginAt = "last_login_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        uuid = try values.decode(String.self, forKey: .uuid)
        username = try values.decode(String.self, forKey: .username)
        authorizedBlocks = try values.decodeIfPresent([AuthorizedBlock].self, forKey: .authorizedBlocks)
        createdAt = try values.decode(String.self, forKey: .createdAt)
        lastLoginAt = try values.decode(String.self, forKey: .lastLoginAt)
    }
}
