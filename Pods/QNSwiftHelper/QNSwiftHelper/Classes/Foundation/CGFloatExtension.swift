//
//  CGFloatExtension.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import Foundation

public extension CGFloat {
    static func * (floatValue: CGFloat, intValue: Int) -> CGFloat {
        return floatValue * CGFloat(intValue)
    }

    static func / (floatValue: CGFloat, intValue: Int) -> CGFloat {
        return floatValue / CGFloat(intValue)
    }

    static func + (floatValue: CGFloat, intValue: Int) -> CGFloat {
        return floatValue + CGFloat(intValue)
    }

    static func - (floatValue: CGFloat, intValue: Int) -> CGFloat {
        return floatValue - CGFloat(intValue)
    }
}
