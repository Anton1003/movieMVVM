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
    private var moduleBulder: ModuleBuilder
    private var detailViewController: DetailViewController?
    private var detailViewModel: DetailViewModel?

    init(navigationController: UINavigationController, builder: ModuleBuilder) {
        self.navigationController = navigationController
        moduleBulder = builder
    }

    func start() {
        detailViewModel = moduleBulder.createDetailViewModel(coordinator: self)
        guard let detailViewModel = detailViewModel else { return }
        detailViewController = moduleBulder.createDetailViewController(coordinator: self, viewModel: detailViewModel)
        guard let detailViewController = detailViewController else { return }
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
