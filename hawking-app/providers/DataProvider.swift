//
//  DataProvider.swift
//  hawking-app
//
//  Created by Laurine Pereira on 12/04/2023.
//

import Alamofire
import Foundation

class DataProvider {
    func getPlayerStatistics(for username: String, _ completion: @escaping (Result<Player, HawkingError>) -> Void) -> Void {
        
        AF.request("http://localhost:3000/api/player/\(username)/block", encoding: URLEncoding.default)
            .responseDecodable(of: Player.self) { response in
                switch response.result {
                case .failure(_):
                    if let data = response.data, let message = try? JSONDecoder().decode(HawkingError.self, from: data).message {
                        completion(.failure(HawkingError(message: message)))
                    } else {
                        completion(.failure(HawkingError(message: "An error occured")))
                    }
                case .success(let data):
                    completion(.success(data))
                }
            }
    }
}
