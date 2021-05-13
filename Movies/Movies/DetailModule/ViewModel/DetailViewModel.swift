//
//  DetailViewModel.swift
//  Movies
//
//  Created by User on 12.05.2021.
//

import Foundation

final class DetailViewModel {
    private var coordinator: DetailCoordinator?
    private var networkingService: NetworkingService?
    private let photoLoader: PhotoLoader

    init(coordinator: DetailCoordinator, networkingService: NetworkingService, photoLoader: PhotoLoader) {
        self.coordinator = coordinator
        self.networkingService = networkingService
        self.photoLoader = photoLoader
    }
}
