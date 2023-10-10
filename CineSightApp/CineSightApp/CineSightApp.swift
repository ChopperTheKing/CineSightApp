//
//  CineSightAppApp.swift
//  CineSightApp
//
//  Created by Ronnie Kissos on 10/5/23.
//

import SwiftUI

@main
struct MovieLookupApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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
                FavoriteMovieView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
            }
        }
    }
}
