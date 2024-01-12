//
//  Posts.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 11.01.2024.
//

import Foundation

// MARK: - Post
struct Post: Codable,Identifiable {
    
    let userID: Int
    let id: Int
    let title: String
    let body: String
}
