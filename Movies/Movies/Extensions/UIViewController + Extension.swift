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
