//
//  RemoveItemFromBasket.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 19.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct RemoveItemFromBasketRequest: RequestRouter {

  let baseURL: URL
  let productID: Int

  let method: HTTPMethod = .post
  let path: String = "removeFromBasket"
  var parameters: Parameters? {
    return [
      "id_product": productID
    ]
  }
}

protocol RemoveItemFromBasketService {
  func removeItemFromBasket(productID: Int, completion: @escaping (RemoveItemFromBasketResponse?) -> Void)
}

class RemoveItemFromBasketServiceImplementation: RemoveItemFromBasketService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func removeItemFromBasket(productID: Int, completion: @escaping (RemoveItemFromBasketResponse?) -> Void) {
    let request = RemoveItemFromBasketRequest(baseURL: baseURL, productID: productID)
    networkService.request(request) { (response: RemoveItemFromBasketResponse?) in
      completion(response)
    }
  }
}
