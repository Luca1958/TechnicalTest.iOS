//
//  PostCommetsCell.swift
//  TechTest
//
//  Created by Connor Johnson on 23/08/2021.
//

import Foundation
import UIKit

final class PostCommetsCell: UITableViewCell {
    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var EmailLbl: UILabel!
    @IBOutlet weak var CommentLbl: UILabel!
    
    func configure(with comment: Comments) {
        NameLbl.text = ("Name: \(comment.name)")
        EmailLbl.text = ("Email: \(comment.email)")
        CommentLbl.text = ("Comment: \(comment.body)")
    }
}

