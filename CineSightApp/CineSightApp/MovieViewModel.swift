//
//  MovieViewModel.swift
//  CineSightApp
//
//  Created by Ronnie Kissos on 10/6/23.
//

import Foundation
import SwiftUI
import Combine

class MovieViewModel: ObservableObject {
    @Published var apiError: Error?
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var showErrorAlert: Bool = false
    @Published var searchText: String = "" {
        didSet {
            searchMovies()
        }
    }
    
    func handleAPIError() {
        if self.error != nil {
            self.showErrorAlert = true
        } else {
            self.showErrorAlert = false
        }
    }
    
    func searchMovies() {
        if !searchText.isEmpty {
            isLoading = true
            MovieService().searchMovies(query: searchText) { result in
                switch result {
                case .success(let movies):
                    self.movies = movies
                    self.isLoading = false
                case .failure(let error):
                    self.error = error
                    self.handleAPIError()
                    self.isLoading = false
                }
            }
        }
    }
}
