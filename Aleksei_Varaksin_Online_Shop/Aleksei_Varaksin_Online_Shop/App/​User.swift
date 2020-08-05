//
//  ​User.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 25/07/2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: Int
    let name: String
    let lastname: String
    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
