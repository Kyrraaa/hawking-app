//
//  HawkingError.swift
//  hawking-app
//
//  Created by Laurine Pereira on 14/04/2023.
//

import Foundation

struct HawkingError: Error, Decodable {
    let message: String
}
