//
//  UIViewController+ViewFlow.swift
//  Pods-QNSwiftHelper_Tests
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import UIKit

public extension UIViewController {
    func viewController<T: UIViewController>(type: T.Type, from storyboardName: String? = nil) -> T {
        if let storyboardName = storyboardName {
            return UIViewController.controller(type: type, at: storyboardName)
        } else if let vc = self.storyboard?.instantiateViewController(withIdentifier: T.identifier) as? T {
            return vc
        } else {
            return T()
        }
    }

    func push<T: UIViewController>(_ type: T.Type, from storyboardName: String? = nil, configure: ((T) -> Void)?) {
        let vc = viewController(type: type, from: storyboardName)
        configure?(vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func present<T: UIViewController>(_ type: T.Type, _ hasNavigation: Bool, from storyboardName: String? = nil, configure: ((T) -> Void)?) {
        let vc = viewController(type: type, from: storyboardName)
        let presentVC: UIViewController!
        if hasNavigation {
            let nav = UINavigationController(rootViewController: vc)
            presentVC = nav
        } else {
            presentVC = vc
        }
        configure?(vc)
        self.present(presentVC, animated: true, completion: nil)
    }

    func pushProgrammatically<T: UIViewController>(_ type: T.Type, configure: ((T) -> Void)?) {
        let vc = T()
        configure?(vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func presentProgrammatically<T: UIViewController>(_ type: T.Type, _ hasNavigation: Bool, configure: ((T) -> Void)?) {
        let vc = T()
        let presentVC: UIViewController!
        if hasNavigation {
            let nav = UINavigationController(rootViewController: vc)
            presentVC = nav
        } else {
            presentVC = vc
        }
        configure?(vc)
        self.present(presentVC, animated: true, completion: nil)
    }
}

