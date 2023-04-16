//
//  BlockData.swift
//  hawking-app
//
//  Created by Laurine Pereira on 12/04/2023.
//

import Foundation

struct BlockData: Decodable {
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case count
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decode(Int.self, forKey: .count)
    }
}
