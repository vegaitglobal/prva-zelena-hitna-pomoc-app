//
//  Coordinating.swift
//  zeleniKljucHakaton
//
//  Created by Milan Djordjevic on 15/10/2022.
//

import Foundation

protocol Coordinating {
    func start()
    func stop()
}

extension Coordinating {
    // This is no need to be in use all the time, so put in extension
    func stop() {
    }
}
