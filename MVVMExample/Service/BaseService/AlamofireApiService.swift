//
//  AlamofireApiService.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 11.01.2024.

// BURDAKİ VERİLERİ SIGNLETON YAPI KULLANARAK YAZ.

import SwiftUI
import Alamofire


class AlamofireApiService: ApiNetworkServiceProtocol {
    
    
    static let shared = AlamofireApiService() // SIGNLETON
    
    private init () { }
    
    // GENERİC FUNC
    
    func getRequest<T>(endpoint: String, parameters: [String : Any]?, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        AF.request(endpoint)
            .validate()
            .responseDecodable(of:T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


