//
//  WeakableClosure.swift
//  Pods
//
//  Created by Quoc Nguyen on 2018/11/20.
//

import Foundation

public protocol Weakable: class { }

extension NSObject: Weakable { }

public extension Weakable {

    func weakable(_ code: @escaping (Self) -> Void) -> () -> Void {
        return { [weak self] in
            guard let `self` = self else {
                return
            }
            code(self)
        }
    }

    func weakable<A>(_ code: @escaping (Self, A) -> Void) -> (A) -> Void {
        return { [weak self] a in
            guard let `self` = self else {
                return
            }
            code(self, a)
        }
    }

    func weakable<A, B>(_ code: @escaping (Self, A, B) -> Void) -> (A, B) -> Void {
        return { [weak self] a, b in
            guard let `self` = self else {
                return
            }
            code(self, a, b)
        }
    }

    func weakable<A, B, C>(_ code: @escaping (Self, A, B, C) -> Void) -> (A, B, C) -> Void {
        return { [weak self] a, b, c in
            guard let `self` = self else {
                return
            }
            code(self, a, b, c)
        }
    }

    func weakable<A, B, C, D>(_ code: @escaping (Self, A, B, C, D) -> Void) -> (A, B, C, D) -> Void {
        return { [weak self] a, b, c, d in
            guard let `self` = self else {
                return
            }
            code(self, a, b, c, d)
        }
    }

    func weakable<A, B, C, D, E>(_ code: @escaping (Self, A, B, C, D, E) -> Void) -> (A, B, C, D, E) -> Void {
        return { [weak self] a, b, c, d, e in
            guard let `self` = self else {
                return
            }
            code(self, a, b, c, d, e)
        }
    }

    func weakable<A, B, C, D, E, F>(_ code: @escaping (Self, A, B, C, D, E, F) -> Void) -> (A, B, C, D, E, F) -> Void {
        return { [weak self] a, b, c, d, e, f in
            guard let `self` = self else {
                return
            }
            code(self, a, b, c, d, e, f)
        }
    }
}
