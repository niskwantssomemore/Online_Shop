//
//  GetReviewsResult.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 05.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Foundation

struct GetReviewsResult: Codable {
    let result: Int
    let product: [Review]
}
