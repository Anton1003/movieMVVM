//
//  MoviesTableViewModel.swift
//  Movies
//
//  Created by User on 13.05.2021.
//

import UIKit

final class MoviesTableViewModel {
//    enum Cell {
//        case moviesCell(MoviesCellViewModel)
//    }

    var onUpdate: () -> () = {}
    var coordinator: MoviesCoordinator
    var networkingService: NetworkingService
    var title = "Movies"

//    private(set) var cells: [MoviesTableViewModel.Cell] = []
    var movies: [Movies]?

    init(coordinator: MoviesCoordinator, networkingService: NetworkingService) {
        self.coordinator = coordinator
        self.networkingService = networkingService
    }

    func viewLoader() {
        networkingService.loadMovies { moviesArray in
            self.movies = moviesArray.results
//            moviesArray.results.forEach {
//                let cell = MoviesCellViewModel(
//                    titleLabel: $0.title,
//                    summaryLabel: $0.releaseDate,
//                    ratingLabel: $0.popularity,
//                    categoriesLabel: $0.voteAverage,
//                    posterPath: $0.posterPath
//                )
//                self.cells.append(.moviesCell(cell))
            self.onUpdate()
        }
    }

    func showDetail(for indexPath: IndexPath) {
        coordinator.showDetail(for: movies?[indexPath.row])
    }

    func numberOfRous() -> Int {
        movies?.count ?? 0
    }

//
//    func cell(for indexPath: IndexPath) {
//        movies?[indexPath.row]
//    }
}
