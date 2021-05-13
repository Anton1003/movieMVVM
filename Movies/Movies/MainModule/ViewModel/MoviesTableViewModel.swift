//
//  MoviesTableViewModel.swift
//  Movies
//
//  Created by User on 13.05.2021.
//

import Foundation

final class MoviesTableViewModel {
    enum Cell {
        case moviesCell(MoviesCellViewModel)
    }

    var coordinator: MoviesCoordinator?

    private var cells: [MoviesTableViewModel.Cell] = []

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
