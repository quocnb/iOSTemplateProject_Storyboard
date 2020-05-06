//
//  UIView+Configure.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import UIKit

public extension UIView {
    func removeAllGestureRecognize() {
        self.gestureRecognizers?.forEach({ (gesture) in
            self.removeGestureRecognizer(gesture)
        })
    }

    func removeAllSubview() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }

    var shadowColor: UIColor? {
        get {
            guard let v = layer.shadowColor else {
                return nil
            }

            return UIColor(cgColor: v)
        }
        set(value) {
            layer.shadowColor = value?.cgColor
        }
    }

    var borderColor: UIColor? {
        get {
            guard let v = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: v)
        }
        set(value) {
            layer.borderColor = value?.cgColor
        }
    }

    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(value) {
            layer.borderWidth = value
        }
    }

    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value) {
            layer.cornerRadius = value
            self.clipsToBounds = true
        }
    }
}
