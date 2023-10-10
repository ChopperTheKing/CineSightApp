//
//  FavoritesView.swift
//  CineSightApp
//
//  Created by kojo on 05/10/2023.
//



import SwiftUI
import CoreData

struct FavoriteMovieView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FavoriteMovie.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FavoriteMovie.title, ascending: true)]) var favoriteMovies: FetchedResults<FavoriteMovie>

    @State private var newMovieTitle = ""
    
    var body: some View {
        VStack {
            TextField("Enter movie title", text: $newMovieTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                addMovie()
            }) {
                Text("Add Favorite Movie")
            }.padding()
            
            List {
                ForEach(favoriteMovies, id: \.id) { movie in
                    Text(movie.title ?? "")
                }
                .onDelete(perform: removeMovie)
            }
        }
    }
    
    func addMovie() {
        let favoriteMovie = FavoriteMovie(context: managedObjectContext)
        favoriteMovie.id = UUID()
        favoriteMovie.title = newMovieTitle
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Failed to save favorite movie: \(error)")
        }
        
        newMovieTitle = "" //clears the input
    }
    
    func removeMovie(at offsets: IndexSet) {
        for index in offsets {
            let movie = favoriteMovies[index]
            managedObjectContext.delete(movie)
        }

        do {
            try managedObjectContext.save()
        } catch {
            print("Failed to remove favorite movie: \(error)")
        }
    }
}

struct FavoriteMovieView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMovieView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
