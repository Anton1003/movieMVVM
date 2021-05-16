//
//  Movie.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import Foundation
///

// MARK: - LoaderModel

///
// struct Movies: Codable {
//    let id: Int
//    let results: [Result]
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case results
//    }
// }

// MARK: - Result

///
struct Film: Codable {
    let results: [Movies]
}

///
struct Movies: Codable {
    let id: Int
    let popularity: Double
    let posterPath, releaseDate, title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}
