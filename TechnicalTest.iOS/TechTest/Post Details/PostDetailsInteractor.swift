//
//  PostDetailsInteractor.swift
//  TechTest
//
//  Created by Connor Johnson on 16/09/2021.
//

import Dispatch

final class PostDetailsInteractor {

    weak var view: PostDetailsViewing?

    func fetchPost(postId: Int) {
        Post.loadPost(withID: postId) { result in
                switch result {
                case .success(let post):
                    DispatchQueue.main.async {
                        self.view?.display(post)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.view?.errorLoading(_error: error)
                    }
                }
        }
    }
}
