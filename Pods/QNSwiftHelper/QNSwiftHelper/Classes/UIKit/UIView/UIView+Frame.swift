//
//  UIView+Frame.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import UIKit

public extension UIView {
    var width: CGFloat {
        get {
            return self.bounds.width
        }
        set {
            var frame = self.bounds
            frame.size.width = newValue
            self.bounds = frame
        }
    }

    var height: CGFloat {
        get {
            return self.bounds.height
        }
        set {
            var frame = self.bounds
            frame.size.height = newValue
            self.bounds = frame
        }
    }

    var x: CGFloat {
        get {
            return self.frame.minX
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }

    var y: CGFloat {
        get {
            return self.frame.minY
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }

    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }

    var size: CGSize {
        get {
            return self.bounds.size
        }
        set {
            var frame = self.bounds
            frame.size = newValue
            self.bounds = frame
        }
    }

    var mid: CGPoint {
        return CGPoint(x: self.width/2, y: self.height/2)
    }
}
