//
//  Loader.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import Foundation

// protocol GetFilmServiceProtocol {
//    func loadMovies(completion: @escaping (Movies) -> Void)
// }

// protocol GetImagesServiceProtocol {
//    func loadPhotos(for filmId: Int, completion: @escaping ([Movies]?) -> ())
// }
// GetImagesServiceProtocol
// protocol NetworkServiceProtocol: GetFilmServiceProtocol {}

final class NetworkingService {
    let baseURL = "https://api.themoviedb.org"
    let apiKey = "?api_key=1383ccd603d60a04c2085457ec3c9e0d"

    func loadMovies(completion: @escaping (Film) -> Void) {
        let path = "/4/list/1"
        guard let url = URL(string: baseURL + path + apiKey)
        else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Film.self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                    return
                }
            }
        }
        task.resume()
    }

//    func loadPhotos(for filmId: Int, completion: @escaping ([Movies]?) -> ()) {}
}
