//
//  Loader.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import Foundation

//protocol GetFilmServiceProtocol {
//    func getMovies(completion: @escaping (Movies) -> Void)
//}
//
//protocol GetImagesServiceProtocol {
//    func loadPhotos(for filmId: Int, completion: @escaping (Result<[Movies]?, Error>) -> ())
//}
//
//protocol NetworkServiceProtocol: GetFilmServiceProtocol, GetImagesServiceProtocol {}

final class NetworkingService {
    func loadMovies(completion: @escaping (Movies) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/4/list/1?api_key=1383ccd603d60a04c2085457ec3c9e0d")
        else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Movies.self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                    return
                }
            }
        }
        task.resume()
    }
}
