//
//  GetItemsList.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 19.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct GetItemsListRequest: RequestRouter {

  let baseURL: URL
  let categoryID: Int

  let method: HTTPMethod = .post
  let path: String = "getItemsList"
  var parameters: Parameters? {
    return [
      "id_category": categoryID
    ]
  }
}

protocol GetItemsListService {
  func getItemsList(categoryID: Int, completion: @escaping (GetItemsListResponse?) -> Void)
}

class GetItemsListServiceImplementation: GetItemsListService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func getItemsList(categoryID: Int, completion: @escaping (GetItemsListResponse?) -> Void) {
    let request = GetItemsListRequest(baseURL: baseURL, categoryID: categoryID)
    networkService.request(request) { (response: GetItemsListResponse?) in
      completion(response)
    }
  }
}
