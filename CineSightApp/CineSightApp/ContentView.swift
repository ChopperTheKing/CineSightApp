//
//  ContentView.swift
//  CineSightApp
//
//  Created by Ronnie Kissos on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var movies: [Movie] = []
    @State private var isLoading = true
    @State private var error: Error?
    
    var body: some View {
        VStack {
            if isLoading {
                Text("Loading...")
            } else if let error = error {
                Text("Error: \(error.localizedDescription)")
            } else {
                List(movies, id: \.title) { movie in
                    Text(movie.title)
                    Text(movie.release_date)
                    Text(movie.overview)
                }
            }
        }
        .onAppear {
            MovieService().searchMovies(query: "Inception") { result in
                self.isLoading = false
                switch result {
                case .success(let fetchedMovies):
                    self.movies = fetchedMovies
                case .failure(let fetchError):
                    self.error = fetchError
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
