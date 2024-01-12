//
//  BaseNetworkServic.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 9.01.2024.
//MARK: - BASE SERVICE

import Foundation  //signleton dependeces enjection constructor içerisine giriyor.

class UserApiService {
    
    // MARK: - DEPENDENCY INJECTION CONSTRUCTOR
    let apiService: ApiNetworkServiceProtocol
    
    init(apiService: ApiNetworkServiceProtocol) {
        self.apiService = apiService
    }
    
    func getUsers(parameters:[String:Any]?,completion: @escaping (Result<[User],Error>) -> Void) {
        apiService.getRequest(endpoint: "https://jsonplaceholder.typicode.com/users", parameters: parameters) { (result:Result<[User],Error>) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
