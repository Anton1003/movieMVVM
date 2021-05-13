//
//  SceneDelegate.swift
//  Movies
//
//  Created by User on 10.03.2021.
//

import UIKit
///
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let networkService = NetworkingService()
        let photoLoader = PhotoLoader()
        let coreDataManager = CoreDataManager()
        let navigationController = UINavigationController()
        let moduleBuilder = ModuleBuilder(
            networkService: networkService,
            photoLoader: photoLoader,
            coreDataManager: coreDataManager,
            navigationController: navigationController
        )
        appCoordinator = moduleBuilder.createAppCoordinator(window: window)
        appCoordinator?.start()
    }
}
