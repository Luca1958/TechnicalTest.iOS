//
// Created by Alex Jackson on 01/03/2021.
//

import Dispatch

final class PostListInteractor {

    weak var view: PostListViewing?

    func fetchAllPosts() {
        Post.loadAll { [self] result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    view?.display(posts)
                    
                }
            case .failure(let error):
                // TODO: - Handle the error
                DispatchQueue.main.async {
                    view?.errorLoading(error: error)
                }
            }
        }
    }
}
