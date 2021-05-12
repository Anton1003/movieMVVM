//
//  UIViewController + Extension.swift
//  Movies
//
//  Created by User on 12.05.2021.
//

import UIKit

extension UIViewController {
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "\(T.self)") as? T
        else {
            fatalError("View controller с идентификатором \(T.self) не найден")
        }
        return controller
    }
}

protocol StoriboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension UIViewController: StoriboardIdentifiable {}

extension StoriboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        String(describing: self)
    }
}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(_: T.Type) -> T {
        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T
        else {
            fatalError("View controller с идентификатором \(T.storyboardIdentifier) не найден")
        }
        return viewController
    }

    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T
        else {
            fatalError("View controller с идентификатором \(T.storyboardIdentifier) не найден")
        }
        return viewController
    }
}
