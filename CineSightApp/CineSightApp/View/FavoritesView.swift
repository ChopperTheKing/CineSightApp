//
//  FavoritesView.swift
//  CineSightApp
//
//  Created by kojo on 05/10/2023.
//

import SwiftUI

struct FavoritesHeaderView: View {
    var title: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        .background(Color.red)
        .foregroundColor(Color.white)
    }
}

struct FavoritesView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            FavoritesHeaderView(title: "FAVORITES")
            Spacer()
            Text("Favorites Page")
            Spacer()
        }
        .padding(.top)
    }
}

struct FavoritesView_Preview: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

//#Preview {
//    FavoritesView()
//}
