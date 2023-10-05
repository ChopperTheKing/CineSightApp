//
//  DetailsView.swift
//  CineSightApp
//
//  Created by kojo on 05/10/2023.
//

import SwiftUI

struct DetailsHeaderView: View {
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

struct DetailsView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            DetailsHeaderView(title: "MOVIE DETAILS")
            Spacer()
            Text("Details Page")
            Spacer()
        }
        .padding(.top)
    }
}

struct DetailsView_Preview: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}

//#Preview {
//    DetailsView()
//}
