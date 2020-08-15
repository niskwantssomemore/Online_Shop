//
//  User.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

struct User: Codable {

  let id: Int
  let login: String
  let name: String
  let lastname: String

  enum CodingKeys: String, CodingKey {
    case id = "id_user"
    case login = "user_login"
    case name = "user_name"
    case lastname = "user_lastname"
  }
}
