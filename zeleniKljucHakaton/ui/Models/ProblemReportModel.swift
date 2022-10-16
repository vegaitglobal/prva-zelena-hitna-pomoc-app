//
//  ProblemReportModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import Foundation

struct ProblemReportModel: Codable {
    let userName: String
    let location: String
    let category: String
    let description: String
    let imagesURL: [String]
}
