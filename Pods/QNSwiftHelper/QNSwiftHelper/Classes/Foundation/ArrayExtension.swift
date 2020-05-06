//
//  ArrayExtension.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/14.
//

import Foundation

public extension Array {
    func safe(_ index: Int) -> Element? {
        guard index >= 0, index < self.count else {
            return nil
        }
        return self[index]
    }
}

public extension Array where Element: Comparable {
    mutating func removeFirst(_ element: Element) {
        if let removeIndex = self.firstIndex(of: element) {
            self.remove(at: removeIndex)
        }
    }

    mutating func removeAll(_ element: Element) {
        self.removeAll { $0 == element }
    }
}
