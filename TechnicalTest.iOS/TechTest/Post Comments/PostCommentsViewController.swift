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
    
    // MARK: - Table View Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedComments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath) as! PostCommetsCell
        let comment = displayedComments[indexPath.row]

        cell.configure(with: comment)
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
