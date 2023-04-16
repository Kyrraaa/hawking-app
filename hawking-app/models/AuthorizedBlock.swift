//
//  Information.swift
//  hawking-app
//
//  Created by Laurine Pereira on 12/04/2023.
//

import Foundation

struct AuthorizedBlock: Identifiable, Decodable {
    let id: Int
    let identifier: String
    let createdAt: String
    let updatedAt: String
    let block: BlockData
    
    enum CodingKeys: String, CodingKey {
        case id
        case identifier
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case block = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        identifier = try values.decode(String.self, forKey: .identifier)
        createdAt = try values.decode(String.self, forKey: .createdAt)
        updatedAt = try values.decode(String.self, forKey: .updatedAt)
        block = try values.decode(BlockData.self, forKey: .block)
    }
}
