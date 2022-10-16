//
//  UIViewController+extensions.swift
//  zeleniKljucHakaton
//
//  Created by Milan Djordjevic on 16/10/2022.
//

import UIKit

extension UIViewController {
    func addToview<T: UIViewController>(to v: UIView, child: T) {
        addChild(child)
        child.view.frame = v.frame
        v.addSubview(child.view)
        child.view.fillSuperview()
        child.didMove(toParent: self)
    }
}
