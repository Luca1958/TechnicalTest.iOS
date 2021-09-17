//
// Created by Alex Jackson on 01/03/2021.
//

import Foundation
import UIKit

protocol PostDetailsViewing: AnyObject {
    func display(_ post: Post)
    
    func errorLoading(_error: Error)
}

final class PostDetailsViewController: UIViewController,PostDetailsViewing {
    func display(_ post: Post) {
        self.loadedPost = post
        self.title = post.title
        self.titleLabel.text = post.title
        self.bodyLabel.text = post.body
            
        self.activityIndicator.stopAnimating()
        
    }
    

    // MARK: - Properties

    var postID: Int!
    private var loadedPost: Post?
    private let interactor = PostDetailsInteractor()
    
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var bodyLabel: UILabel!
    @IBOutlet private(set) var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var CommentsButton: UIButton!
    
    // MARK: - UIViewController Overrides

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.view = self
        if loadedPost == nil {
            activityIndicator.startAnimating()
            title = "Loading…"
            interactor.fetchPost(postId: postID)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PostCommentsViewController
        vc.postID = self.postID
    }
    
    
    
    func errorLoading(_error: Error){
        let alert = UIAlertController(title: "Unable to load data", message: "Error loading post please try again", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Reload", style: .default, handler: { UIAlertAction in
            //self.interactor.fetchAllPosts()
        }))

        self.present(alert, animated: true)
    }
}
