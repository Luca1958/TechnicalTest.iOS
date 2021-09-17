//
//  PostCommentsViewController.swift
//  TechTest
//
//  Created by Connor Johnson on 22/08/2021.
//

import Foundation
import UIKit

protocol CommentListViewing: AnyObject {
    func display(_ Comments: [Comments])
    
    func errorLoading(_error: Error)
}

final class PostCommentsViewController: UITableViewController, CommentListViewing {
    
    private let interactor = PostCommentsInteractor()
    private static let cellIdentifier = "Cell"
    var postID: Int!
    private var displayedComments: [Comments] = []
    
    override func viewDidLoad() {
        interactor.view = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fetchAllComments(postID: postID)
    }
    
    func display(_ comments: [Comments]) {
        displayedComments = comments
        tableView.reloadData()
    }
    
    func errorLoading(_error: Error){
        let alert = UIAlertController(title: "Unable to load data", message: "Error loading post please try again", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Reload", style: .default, handler: { UIAlertAction in
            self.interactor.fetchAllComments(postID: self.postID)
        }))

        self.present(alert, animated: true)
    }
    
    // MARK: - Table View Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedComments.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return 300
       }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath) as! PostCommetsCell
        let comment = displayedComments[indexPath.row]

        cell.configure(with: comment)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
