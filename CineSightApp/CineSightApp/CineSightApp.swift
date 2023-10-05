//
//  CineSightAppApp.swift
//  CineSightApp
//
//  Created by Ronnie Kissos on 10/5/23.
//

import SwiftUI

@main
struct MovieLookupApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
//                ContentView()
                SearchView()
                    .tabItem {
                        Image(systemName: "popcorn")
                    }
                DetailsView()
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                    }
                FavoritesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
            }
        }
    }
}
