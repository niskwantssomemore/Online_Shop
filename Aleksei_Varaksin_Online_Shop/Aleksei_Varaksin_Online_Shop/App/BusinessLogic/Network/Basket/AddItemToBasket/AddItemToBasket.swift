//
//  AddItemToBasket.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 19.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct AddItemToBasketRequest: RequestRouter {

  let baseURL: URL
  let productID: Int
  let quantity: Int

  let method: HTTPMethod = .post
  let path: String = "addToBasket"
  var parameters: Parameters? {
    return [
      "id_product": productID,
      "quantity": quantity
    ]
  }
}

protocol AddItemToBasketService {
  func addItemToBasket(productID: Int, quantity: Int, completion: @escaping (AddItemToBasketResponse?) -> Void)
}

class AddItemToBasketServiceImplementation: AddItemToBasketService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func addItemToBasket(productID: Int, quantity: Int, completion: @escaping (AddItemToBasketResponse?) -> Void) {
    let request = AddItemToBasketRequest(baseURL: baseURL, productID: productID, quantity: quantity)
    networkService.request(request) { (response: AddItemToBasketResponse?) in
      completion(response)
    }
  }
}
