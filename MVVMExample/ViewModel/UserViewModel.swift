//
//  ContentViewModel.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 9.01.2024.
//

import SwiftUI

class UserViewModel:ObservableObject {
        
    @Published var users = [User]()
    
    let userApiService : UserApiService
    
    init(userApiService: UserApiService) {
        self.userApiService = userApiService
    }
   
}
