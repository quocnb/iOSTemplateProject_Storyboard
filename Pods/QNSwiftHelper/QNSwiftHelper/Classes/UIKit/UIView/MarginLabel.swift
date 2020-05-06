//
//  MarginLabel.swift
//  Pods
//
//  Created by Quoc Nguyen on 2019/03/05.
//

import UIKit

public class MarginLabel: UILabel {

    public var insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5) {
        didSet {
            drawText(in: bounds)
        }
    }

    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

}
