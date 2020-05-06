//
//  UITableView+Extension.swift
//  QNSwiftHelper
//
//  Created by Quoc Nguyen on 2018/10/31.
//

import UIKit

// MARK: - SAFE LOADING
public extension UITableView {
    func safeReloadData() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

// MARK: - REGISTER AND REUSE
public extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type, fromNib: Bool = true) {
        if fromNib {
            self.register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: cellType.identifier)
        }
    }

    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ type: T.Type, fromNib: Bool = true) {
        if fromNib {
            self.register(T.nib, forHeaderFooterViewReuseIdentifier: T.identifier)
        } else {
            self.register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
        }
    }

    func reuseCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        let reuse = self.dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath)
        return reuse as? T ?? T()
    }

    func reuseHeaderFooter<T: UITableViewHeaderFooterView>(_ type: T.Type, for indexPath: IndexPath) -> T {
        let reuse = self.dequeueReusableHeaderFooterView(withIdentifier: T.identifier)
        return reuse as? T ?? T()
    }

}

extension UITableViewCell {
    open override func awakeFromNib() {
        self.selectionStyle = .none
    }
}
