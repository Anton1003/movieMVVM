//
//  DetailCoordinator.swift
//  Movies
//
//  Created by User on 12.05.2021.
//

import UIKit

final class DetailCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let detailController: DetailViewController = .instantiate()
        // create event
    }
}
