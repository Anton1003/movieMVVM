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
        let moviesTableViewController = MoviesTableViewController.instantiate()
        navigationController.setViewControllers([moviesTableViewController], animated: false)
    }
}
