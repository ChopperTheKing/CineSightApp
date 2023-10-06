//
//  MovieService.swift
//  CineSightApp
//
//  Created by Ronnie Kissos on 10/5/23.
//

import Foundation

class MovieService {
    func searchMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=INVALID_API_KEY&query=\(query)"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                            completion(.success(searchResponse.results))
                        } catch let decodeError {
                            completion(.failure(decodeError))
                        }
                    }
                }
            }.resume()
        }
    }
}

struct SearchResponse: Decodable {
    var results: [Movie]
}
