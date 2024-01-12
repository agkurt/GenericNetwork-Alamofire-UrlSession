//
//  UrlSessionApiService.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 11.01.2024.
//
// ANA API SERVICE DA HER ZAMAN SIGNLETON

import Foundation

class UrlSessionApiService: ApiNetworkServiceProtocol {
    
    
    static let shared = UrlSessionApiService()
    
    private init () { }
    
    func getRequest<T>(endpoint: String, parameters: [String : Any]?, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError(domain: "Invalid URl", code: 0 , userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Data not found", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
}
