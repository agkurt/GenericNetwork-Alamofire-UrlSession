//
//  ContentView.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 6.01.2024.
//

import SwiftUI

struct ContentView: View {
      
    @StateObject var postViewModel : PostViewModel
    
    init(apiService: ApiNetworkServiceProtocol) {
        _postViewModel = StateObject(wrappedValue: PostViewModel(postService: .init(apiService: apiService)))
    }
    var body: some View {
        NavigationStack {
            VStack {
                PostListView()
            }
            .navigationTitle("Posts")
        }
    }

}
