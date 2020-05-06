//
//  UIView+Autolayout.swift
//  QNSwiftHelper
//
//  Created by Quoc Nguyen on 2018/10/31.
//

import UIKit

public extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leftAnchor
        }else {
            return self.leftAnchor
        }
    }
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.rightAnchor
        }else {
            return self.rightAnchor
        }
    }
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }

    func fillSuperView(inset: UIEdgeInsets = .zero) {
        guard let superView = self.superview else {
            fatalError("You must add view to super view first")
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.safeTopAnchor.constraint(equalTo: superView.safeTopAnchor, constant: inset.top),
            superView.safeBottomAnchor.constraint(equalTo: self.safeBottomAnchor, constant: inset.bottom),
            self.safeLeadingAnchor.constraint(equalTo: superView.safeLeadingAnchor, constant: inset.left),
            superView.safeTrailingAnchor.constraint(equalTo: self.safeTrailingAnchor, constant: inset.right)
            ])
    }
}

