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

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let moviesTableViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(MoviesTableViewController.self)
        let moviesViewModel = MoviesTableViewModel()
        moviesViewModel.coordinator = self
        moviesTableViewController.viewModel = moviesViewModel
        navigationController.setViewControllers([moviesTableViewController], animated: false)
    }

    func showDetail() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
}
