//
//  Review.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 05.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Foundation

struct Review: Codable {
    let id: Int
    let user: User
    let product: Product
    let text: String
    enum CodingKeys: String, CodingKey {
        case id = "review_id"
        case user = "user"
        case product = "product"
        case text = "review_text"
    }
}
