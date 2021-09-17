//
// Created by Alex Jackson on 01/03/2021.
//

import Foundation

extension Post {
    static func loadAll(_ completion: @escaping (Result<[Post], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        HttpGet(url: url) { Data in
            do {
                let posts = try JSONDecoder().decode([Post].self, from: Data)
                completion(.success(posts))
            } catch {
                completion(.failure(error))
            }
        }
    }

    static func loadPost(withID postID: Int, completion: @escaping (Result<Post, Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postID)")!
        HttpGet(url: url) { Data in
            do {
                let post = try JSONDecoder().decode(Post.self, from: Data)
                completion(.success(post))
            } catch {
                completion(.failure(error))
            }
        }

    }
    
    static func loadComments(withID postID: Int, completion: @escaping (Result<[Comments], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postID)/comments/")!
        
        HttpGet(url: url) { Data in
            do {
                let comments = try JSONDecoder().decode([Comments].self, from: Data)
                completion(.success(comments))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    static func HttpGet (url: URL, completionHandler: @escaping (Data) -> Void) {

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
            }
        
           if let data = data {
            completionHandler(data)
           } else if let error = error {
            print("HTTP Request Failed \(error)")
           }
       }

    task.resume()
}
}

