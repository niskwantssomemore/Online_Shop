//
//  GetUsersBasket.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 19.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct GetUsersBasketRequest: RequestRouter {

  let baseURL: URL
  let userID: Int

  let method: HTTPMethod = .post
  let path: String = "getUsersBasket"
  var parameters: Parameters? {
    return [
      "id_user": userID
    ]
  }
}

protocol GetUsersBasketService {
  func getUsersBasket(userID: Int, completion: @escaping (GetUsersBasketResponse?) -> Void)
}

class GetUsersBasketServiceImplementation: GetUsersBasketService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func getUsersBasket(userID: Int, completion: @escaping (GetUsersBasketResponse?) -> Void) {
    let request = GetUsersBasketRequest(baseURL: baseURL, userID: userID)
    networkService.request(request) { (response: GetUsersBasketResponse?) in
      completion(response)
    }
  }
}
