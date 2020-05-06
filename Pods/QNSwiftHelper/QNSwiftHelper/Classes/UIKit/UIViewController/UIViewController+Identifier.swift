//
//  UIViewController+Identifier.swift
//  Pods
//
//  Created by Quoc Nguyen on 2019/01/21.
//

import UIKit

public extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }

    static func controller<T: UIViewController>(type: T.Type, at storyboardName: String = "Main", bundle: Bundle? = nil) -> T {
        return UIStoryboard(name: storyboardName, bundle: bundle)
            .instantiateViewController(withIdentifier: T.identifier) as? T ?? T()
    }

    static func controllerFromXib<T: UIViewController>(type: T.Type, bundle: Bundle? = nil) -> T {
        return UIViewController(nibName: T.identifier, bundle: bundle) as? T ?? T()
    }
}

