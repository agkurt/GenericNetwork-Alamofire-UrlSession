//
//  UserModel.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 6.01.2024.
//

struct User: Codable,Identifiable {
    let id: Int
    let name: String
    let email: String
  
}
