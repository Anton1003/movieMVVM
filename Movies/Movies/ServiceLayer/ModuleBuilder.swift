//
//  ModuleBuilder.swift
//  Movies
//
//  Created by User on 05.05.2021.
//

import UIKit

protocol BuilderProtocol {
    func createAppCoordinator(window: UIWindow) -> AppCoordinator

    func createMoviesCoordinator(coordinator: AppCoordinator) -> MoviesCoordinator
    func createDetailCoordinator(coordinator: AppCoordinator) -> DetailCoordinator

    func createMoviesTableViewController(coordinator: MoviesCoordinator, viewModel: MoviesTableViewModel)
        -> MoviesTableViewController
    func createMoviesViewModel(coordinator: MoviesCoordinator) -> MoviesTableViewModel

    func createDetailViewController(coordinator: DetailCoordinator, viewModel: DetailViewModel)
        -> DetailViewController
    func createDetailViewModel(coordinator: DetailCoordinator) -> DetailViewModel

    init(
        networkService: NetworkingService,
        photoLoader: PhotoLoader,
        coreDataManager: CoreDataManager,
        navigationController: UINavigationController
    )
}

final class ModuleBuilder: BuilderProtocol {
    private let networkService: NetworkingService
    private let photoLoader: PhotoLoader
    private let coreDataManager: CoreDataManager
    private var navigationController: UINavigationController

    init(
        networkService: NetworkingService,
        photoLoader: PhotoLoader,
        coreDataManager: CoreDataManager,
        navigationController: UINavigationController
    ) {
        self.networkService = networkService
        self.photoLoader = photoLoader
        self.coreDataManager = coreDataManager
        self.navigationController = navigationController
    }

    func createAppCoordinator(window: UIWindow) -> AppCoordinator {
        let appCoordinator = AppCoordinator(window: window, navigationController: navigationController, builder: self)
        return appCoordinator
    }

    func createMoviesCoordinator(coordinator: AppCoordinator) -> MoviesCoordinator {
        let moviesCoordinator = MoviesCoordinator(navigationController: navigationController, builder: self)
        return moviesCoordinator
    }

    func createMoviesTableViewController(
        coordinator: MoviesCoordinator,
        viewModel: MoviesTableViewModel
    ) -> MoviesTableViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(MoviesTableViewController.self)
        view.viewModel = viewModel
        return view
    }

    func createMoviesViewModel(coordinator: MoviesCoordinator) -> MoviesTableViewModel {
        let viewModel = MoviesTableViewModel(coordinator: coordinator, networkingService: networkService)
        return viewModel
    }

    func createDetailCoordinator(coordinator: AppCoordinator) -> DetailCoordinator {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, builder: self)
        return detailCoordinator
    }

    func createDetailViewController(
        coordinator: DetailCoordinator,
        viewModel: DetailViewModel
    ) -> DetailViewController {
        let detailController = UIStoryboard(name: "Detail", bundle: nil)
            .instantiateViewController(DetailViewController.self)
        detailController.viewModel = viewModel
        return detailController
    }

    func createDetailViewModel(coordinator: DetailCoordinator) -> DetailViewModel {
        let viewModel = DetailViewModel(
            coordinator: coordinator,
            networkingService: networkService,
            photoLoader: photoLoader
        )
        return viewModel
    }
}
