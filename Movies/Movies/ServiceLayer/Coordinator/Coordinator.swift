//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by User on 11.05.2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
