//
//  PostListView.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 12.01.2024.
//

import SwiftUI

struct PostListView: View {
    
    @StateObject var viewModel = PostViewModel(postService: .init(apiService: AlamofireApiService.shared))
    
    var body: some View {
        VStack {
            List(viewModel.posts) { post in
                NavigationLink(destination: PostDetailView(post: post)) {
                    HStack {
                        Text("\(post.id)")
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .bold()
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchPost(parameters: nil)
        }
    }
}

#Preview {
    PostListView()
}
