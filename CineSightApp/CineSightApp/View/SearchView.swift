//
//  SearchView.swift
//  CineSightApp
//
//  Created by kojo on 05/10/2023.
//

import SwiftUI

struct HeaderView: View {
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

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "SEARCH MOVIES")
            SearchBar(text: $searchText)
            Spacer()
            Text("Search Movies")
            Spacer()
        }
        .padding(.top)
    }
}

struct SearchView_Preview: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

//#Preview {
//    SearchView()
//}
