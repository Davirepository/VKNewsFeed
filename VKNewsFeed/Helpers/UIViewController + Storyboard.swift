//
//  UIViewController + Storyboard.swift
//  VKNewsFeed
//
//  Created by Давид on 03/06/2019.
//  Copyright © 2019 Давид. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        // пробуем создать контроллер по заданному имени
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
    
}
