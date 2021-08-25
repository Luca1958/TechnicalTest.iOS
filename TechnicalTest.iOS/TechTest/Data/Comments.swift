//
//  Comments.swift
//  TechTest
//
//  Created by Connor Johnson on 23/08/2021.
//

struct Comments: Equatable, Codable {
    let postId: Int
    let id: Int
    var name: String
    var email: String
    var body: String
}
