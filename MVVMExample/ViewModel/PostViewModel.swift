//
//  PostViewModel.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 11.01.2024.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var posts:[Post] = []
    
    let postService : PostsApiService
    
    init(postService: PostsApiService) {
        self.postService = postService
    }
    
    func fetchPost(parameters:[String:Any]?) {
        postService.getPosts(parameters: parameters) { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.posts = posts
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
