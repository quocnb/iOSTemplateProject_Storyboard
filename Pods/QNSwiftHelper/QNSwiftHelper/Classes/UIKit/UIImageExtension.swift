//
//  UIImageExtension.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import UIKit

public extension UIImage {
    var width: CGFloat {
        return size.width
    }

    var height: CGFloat {
        return size.height
    }

    func resizeKeepRatio(newWidth: CGFloat) -> UIImage {
        let ratio = newWidth / size.width
        let newHeight = size.height * ratio
        let newSize = CGSize(width: newWidth, height: newHeight)
        return self.resize(to: newSize)
    }

    func resize(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}

