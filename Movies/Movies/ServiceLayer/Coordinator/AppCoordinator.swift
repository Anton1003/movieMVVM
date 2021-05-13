//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by User on 11.05.2021.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()

        let moviesCoordinator = MoviesCoordinator(navigationController: navigationController)
        childCoordinators.append(moviesCoordinator)
        moviesCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
