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
        let detailController = UIStoryboard(name: "Detail", bundle: nil)
            .instantiateViewController(DetailViewController.self)
        let detailViewModel = DetailViewModel()
        detailViewModel.coordinator = self
        detailController.viewModel = detailViewModel
        navigationController.pushViewController(detailController, animated: true)
    }
}
