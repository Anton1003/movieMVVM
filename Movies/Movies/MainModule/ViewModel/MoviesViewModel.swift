//
//  MoviesViewModel.swift
//  Movies
//
//  Created by User on 12.05.2021.
//

import Foundation

final class MoviesViewModel {
    var coordinator: MoviesCoordinator?

    func showDetail() {
        coordinator?.showDetail()
    }
}
