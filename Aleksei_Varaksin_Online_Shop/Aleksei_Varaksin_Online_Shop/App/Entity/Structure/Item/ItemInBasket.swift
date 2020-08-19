//
//  ItemInBasket.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 19.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

struct ItemInBasket: Codable {
  let productID: Int
  let productName: String
  let price: Int
  let quantity: Int
}
