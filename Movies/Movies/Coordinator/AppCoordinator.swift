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
    private var moduleBuilder: ModuleBuilder
    private var navigationController: UINavigationController
    private let window: UIWindow

    init(window: UIWindow, navigationController: UINavigationController, builder: ModuleBuilder) {
        self.window = window
        self.navigationController = navigationController
        moduleBuilder = builder
    }

    func start() {
        let moviesCoordinator = moduleBuilder.createMoviesCoordinator(coordinator: self)
        childCoordinators.append(moviesCoordinator)
        moviesCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}