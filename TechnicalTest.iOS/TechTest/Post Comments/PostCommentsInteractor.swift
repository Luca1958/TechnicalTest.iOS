//
//  PostCommentsInteractor.swift
//  TechTest
//
//  Created by Connor Johnson on 23/08/2021.
//
import Dispatch

final class PostCommentsInteractor {

    weak var view: CommentListViewing?

    func fetchAllComments(postID: Int) {
        Post.loadComments(withID: postID) { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    view?.display(comments)
                    
                case .failure:
                    break
                }
            }
        }
    }
}
