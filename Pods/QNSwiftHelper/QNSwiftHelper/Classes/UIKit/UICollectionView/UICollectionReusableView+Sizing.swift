//
//  UICollectionReusableView+Sizing.swift
//  Pods
//
//  Created by Quoc Nguyen on 2019/03/05.
//

import UIKit

public extension UICollectionReusableView {
    static func autoResizingView<T: UICollectionReusableView>(type: T.Type) -> T {
        let nibViews = Bundle.main.loadNibNamed(T.identifier, owner: nil, options: nil)
        return nibViews?.first as? T ?? T()
    }

    static func autoLayoutSize<T: UICollectionReusableView>(type: T.Type, targetWidth: CGFloat, configure: ((T) -> Void)?) -> CGSize {
        let resizingView = UICollectionReusableView.autoResizingView(type: type)
        resizingView.prepareForReuse()
        configure?(resizingView)
        resizingView.setNeedsLayout()
        resizingView.layoutIfNeeded()

        let targetSize = CGSize(width: targetWidth, height: 0)
        let calculateView: UIView
        if let contentView = (resizingView as? UICollectionViewCell)?.contentView {
            calculateView = contentView
        } else {
            calculateView = resizingView
        }
        // Calculate the size (height) using Auto Layout
        let autoLayoutSize = calculateView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow)
        return autoLayoutSize
    }
}
