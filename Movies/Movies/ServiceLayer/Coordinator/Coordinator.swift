//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by User on 11.05.2021.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
