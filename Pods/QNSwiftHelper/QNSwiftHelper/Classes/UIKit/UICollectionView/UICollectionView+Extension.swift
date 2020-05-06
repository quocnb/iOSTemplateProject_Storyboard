//
//  UICollectionView+Extension.swift
//  QNSwiftHelper
//
//  Created by Quoc Nguyen on 2018/10/31.
//

import UIKit

// MARK: - SAFE RELOAD
public extension UICollectionView {
    func safeReloadData() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

// MARK: - REGISTER COLLECTIONVIEW CELL
public extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellType: T.Type, fromNib: Bool = true) {
        if fromNib {
            self.register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
        } else {
            self.register(cellType.self, forCellWithReuseIdentifier: cellType.identifier)
        }
    }

    func reuseCell<T: UICollectionViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        let reuseCell = self.dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath)
        return reuseCell as? T ?? T()
    }

}

// MARK: - REGISTER HEADER FOOTER VIEW
public extension UICollectionView {
    func reuseHeaderView<T: UICollectionReusableView>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return reuseSupplementaryView(kind: UICollectionView.elementKindSectionHeader, type: type, for: indexPath)
    }

    func reuseFooterView<T: UICollectionReusableView>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return reuseSupplementaryView(kind: UICollectionView.elementKindSectionFooter, type: type, for: indexPath)
    }

    func reuseSupplementaryView<T: UICollectionReusableView>(kind: String, type: T.Type, for indexPath: IndexPath) -> T {
        let view = self.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: T.identifier,
            for: indexPath)
        return view as? T ?? T()
    }

    func registerHeaderView<T: UICollectionReusableView>(_ type: T.Type, fromNib: Bool = true) {
        registerSupplementaryView(kind: UICollectionView.elementKindSectionHeader, type: type, fromNib: fromNib)
    }

    func registerFooterView<T: UICollectionReusableView>(_ type: T.Type, fromNib: Bool = true) {
        registerSupplementaryView(kind: UICollectionView.elementKindSectionFooter, type: type, fromNib: fromNib)
    }

    func registerSupplementaryView<T: UICollectionReusableView>(kind: String, type: T.Type, fromNib: Bool = true) {
        if fromNib {
            self.register(
                T.nib,
                forSupplementaryViewOfKind: kind,
                withReuseIdentifier: T.identifier)
        } else {
            self.register(
                T.self,
                forSupplementaryViewOfKind: kind,
                withReuseIdentifier: T.identifier)
        }
    }
}
