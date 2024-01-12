//
//  PostsApiService.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 11.01.2024.
//

import Foundation

class PostsApiService {
    
    //MARK: - DEPENDENCY INJECTION CONSTRUCTOR
    
    let apiService: ApiNetworkServiceProtocol
    
    init(apiService: ApiNetworkServiceProtocol) {
        self.apiService = apiService
    }
    
    func getPosts(parameters: [String:Any]?,completion: @escaping (Result<[Post],Error>) -> Void) {
        apiService.getRequest(endpoint: "https://jsonplaceholder.typicode.com/users",parameters: parameters) { (result:Result<[Post],Error>) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
