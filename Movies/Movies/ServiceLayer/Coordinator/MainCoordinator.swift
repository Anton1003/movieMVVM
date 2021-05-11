//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by User on 11.05.2021.
//

import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(MoviesTableViewController.self)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showDetail() {
        let vc = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(DetailViewController.self)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
