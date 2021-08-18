//
//  HomeService.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeServicing {
    func InitialFetch(completion: @escaping ((Result<[Dog], APIError>) -> Void))
}

final class HomeService: HomeServicing {
    func InitialFetch(completion: @escaping ((Result<[Dog], APIError>) -> Void)) {
        guard let url = URL(string: "https://api.TheDogAPI.com/v1/breeds") else {
            return
        }
        AF.request(url, method: .get).responseJSON { (result) in
            DispatchQueue.main.async {
                guard let data = result.data else {
                    completion(.failure(.genericError))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let response = try decoder.decode([Dog].self, from: data)
                    completion(.success(response))
                } catch { completion(.failure(.genericError)) }
            }
        }
    }
}
