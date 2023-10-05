//
//  Movie.swift
//  CineSightApp
//
//  Created by Ronnie Kissos on 10/5/23.
//

import Foundation

struct Movie: Codable {
    var title: String
    var release_date: String
    var overview: String
    var poster_path: String?
}
