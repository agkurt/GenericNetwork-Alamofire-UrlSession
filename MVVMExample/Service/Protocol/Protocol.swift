//
//  Protocol.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 11.01.2024.
//

protocol ApiNetworkServiceProtocol {
    
    func getRequest<T: Codable>(endpoint: String, parameters: [String: Any]?,completion: @escaping (Result<T,Error>) -> Void )
}
