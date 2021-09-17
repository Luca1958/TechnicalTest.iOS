//
//  TechTestTests.swift
//  TechTestTests
//
//  Created by Alex Jackson on 01/03/2021.
//

import XCTest
@testable import TechTest

class TechTestTests: XCTestCase {
    
    func testGetAllPosts(){
        let result: [Post]
        Post.loadAll { [self] result in
            switch result {
            case .success(let posts):
                XCTAssertNotNil(posts)
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
    }
    
    func testGetPost(){
        let result: [Post]
        Post.loadPost(withID: 1) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    XCTAssertNotNil(posts)
                case .failure(let error):
                    XCTFail("\(error)")
                }
            }
        }
    }
    
}


