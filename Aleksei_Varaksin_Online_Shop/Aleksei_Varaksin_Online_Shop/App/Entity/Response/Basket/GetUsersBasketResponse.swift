//
//  GetUsersBasketResponse.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 19.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

struct GetUsersBasketResponse: Codable {
  let result: Int
  let sumTotal: Int?
  let itemsCount: Int?
  let products: [ItemInBasket]?
  let userMessage: String?
}
