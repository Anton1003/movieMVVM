//
//  MoviesTableViewModel.swift
//  Movies
//
//  Created by User on 13.05.2021.
//

import UIKit

final class MoviesTableViewModel {
    enum Cell {
        case moviesCell(MoviesCellViewModel)
    }

    var coordinator: MoviesCoordinator?
    var networkingService: NetworkingService?

    private(set) var cells: [MoviesTableViewModel.Cell] = []

    init(coordinator: MoviesCoordinator, networkingService: NetworkingService) {
        self.coordinator = coordinator
        self.networkingService = networkingService
    }

    func viewLoader() {
        guard let networkingService = networkingService else { return }
        networkingService.loadMovies { moviesArray in
            moviesArray.results.forEach {
                let cell = MoviesCellViewModel(
                    titleLabel: $0.title,
                    summaryLabel: $0.releaseDate,
                    ratingLabel: $0.popularity,
                    categoriesLabel: $0.voteAverage,
                    posterPath: $0.posterPath
                )
                self.cells.append(.moviesCell(cell))
            }
        }
    }

    func showDetail() {
        coordinator?.showDetail()
    }

    func numberOfRous() -> Int {
        cells.count
    }

    func cell(for indexPath: IndexPath) -> Cell {
        cells[indexPath.row]
    }
}
