//
//  GetItemsListResponse.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 19.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

struct GetItemsListResponse: Codable {
  let result: Int
  let pageNumber: Int?
  let products: [Item]?
  let userMessage: String?
}
