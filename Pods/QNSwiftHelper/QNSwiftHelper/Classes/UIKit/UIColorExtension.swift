//
//  UIColorExtension.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import UIKit

public extension UIColor {
    convenience init(r: UInt8, g: UInt8, b: UInt8, a: CGFloat = 1.0) {
        func convertToFloat(_ int: UInt8) -> CGFloat {
            return CGFloat(int)/255.0
        }
        self.init(
            red: convertToFloat(r),
            green: convertToFloat(g),
            blue: convertToFloat(b),
            alpha: a
        )
    }

    convenience init(hex: String, alpha: CGFloat = 1) {
        var hexa = hex
        if hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hexa = String(hex[index...])
        }
        guard hexa.count == 6 else {
            self.init(white: 0.0, alpha: 0.0)
            return
        }
        var rgbValue: UInt32 = 0
        Scanner(string: hexa).scanHexInt32(&rgbValue)
        let red = UInt8((rgbValue & 0xFF0000) >> 16)
        let green = UInt8((rgbValue & 0x00FF00) >> 8)
        let blue = UInt8(rgbValue & 0x0000FF)
        self.init(r: red, g: green, b: blue, a: alpha)
    }

    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}

