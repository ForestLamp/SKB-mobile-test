//
//  NetworkService.swift
//  SKB mobile test
//
//  Created by Alex Ch. on 03.02.2022.
//

import Foundation

class NetworkService: Decodable {
    
    func  request(urlString: String, completion: @escaping (Result<[SearchResponse], Error>)-> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url){(data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let contacts = try JSONDecoder().decode([SearchResponse].self, from: data)
                    completion(.success(contacts))
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
