//
//  Storyboarded.swift
//  CoordinatorTest
//
//  Created by User on 11.05.2021.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        
        let className = fullName.components(separatedBy: ".")[1]
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: className) as! Self
        
        return storyboard
    }
}
