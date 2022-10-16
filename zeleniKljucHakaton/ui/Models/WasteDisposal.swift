//
//  WasteDisposal.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/16/22.
//

import Foundation

struct WasteDisposal: Codable {
    let title: String?
    var description: String?
    var locations: [WasteDisposalLocation]?
}
