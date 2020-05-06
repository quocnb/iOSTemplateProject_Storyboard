//
//  UIView+Identifier.swift
//  QNSwiftHelper
//
//  Created by Quoc Nguyen on 2018/10/31.
//

import UIKit

public extension UIView {
    class var identifier: String {
        return String(describing: self)
    }

    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    var identifier: String {
        return String(describing: type(of: self))
    }

    func loadXib() {
        let nibData = Bundle.main.loadNibNamed(
            self.identifier, owner: self, options: nil
        )
        guard let content = nibData?.first as? UIView else {
            return
        }
        content.backgroundColor = UIColor.clear
        self.addSubview(content)
        content.frame = self.bounds
        content.fillSuperView()
    }
}
