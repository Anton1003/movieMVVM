//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by User on 11.05.2021.
//

import UIKit

final class MoviesCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private var moduleBulder: ModuleBuilder
    private var moviesTableViewController: MoviesTableViewController?
    private var moviesViewModel: MoviesTableViewModel?

    init(navigationController: UINavigationController, builder: ModuleBuilder) {
        self.navigationController = navigationController
        moduleBulder = builder
    }

    func start() {
        moviesViewModel = moduleBulder.createMoviesViewModel(coordinator: self)
        guard let moviesViewModel = moviesViewModel else { return }
        moviesTableViewController = moduleBulder.createMoviesTableViewController(
            coordinator: self,
            viewModel: moviesViewModel
        )
        guard let moviesTableViewController = moviesTableViewController else { return }
        navigationController.setViewControllers([moviesTableViewController], animated: false)
    }

    func showDetail() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, builder: moduleBulder)
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
}
