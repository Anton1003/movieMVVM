//
//  Photo.swift
//  Movies
//
//  Created by User on 09.05.2021.
//

import Foundation
///
struct PhotoModel: Codable {
    let id: Int
    let backdrops: [Photo]
}

final class Photo {
    var filePath = ""
}

extension Photo: Codable {
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}
