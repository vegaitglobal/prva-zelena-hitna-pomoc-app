//
//  CategoryModel.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import Foundation

struct CategoryModel: Codable  {
    let id: String?
    let name: String?
    let image: String?
    let description: String?
    let subcategories: [Link]?
}
