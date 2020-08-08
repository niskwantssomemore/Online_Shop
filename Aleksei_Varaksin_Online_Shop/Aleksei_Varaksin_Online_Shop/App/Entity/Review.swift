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
    let productId: Int
    let text: String
    enum CodingKeys: String, CodingKey {
        case id = "review_id"
        case user = "user"
        case productId = "product_id"
        case text = "review_text"
    }
}
