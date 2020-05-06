//
//  StringExtension.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import UIKit

public extension String {
    func toArray() -> [String] {
        return self.map({ String($0) })
    }
}
