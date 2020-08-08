//
//  Product.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 05.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id: Int
    let categoryId: Int
    let name: String
    let description: String
    let reviews: [Review]
    enum CodingKeys: String, CodingKey {
        case id = "product_id"
        case categoryId = "product_category_id"
        case name = "product_name"
        case description = "product_description"
        case reviews = "product_reviews"
    }
}
