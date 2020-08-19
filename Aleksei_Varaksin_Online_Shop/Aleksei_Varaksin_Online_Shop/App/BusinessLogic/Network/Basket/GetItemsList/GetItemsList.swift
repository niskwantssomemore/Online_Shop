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
  let pageNumber: Int
  let categoryID: Int

  let method: HTTPMethod = .post
  let path: String = "getItemsList"
  var parameters: Parameters? {
    return [
      "page_number": pageNumber,
      "id_category": categoryID
    ]
  }
}

protocol GetItemsListService {
  func getItemsList(pageNumber: Int, categoryID: Int, completion: @escaping (GetItemsListResponse?) -> Void)
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

  func getItemsList(pageNumber: Int, categoryID: Int, completion: @escaping (GetItemsListResponse?) -> Void) {
    let request = GetItemsListRequest(baseURL: baseURL, pageNumber: pageNumber, categoryID: categoryID)
    networkService.request(request) { (response: GetItemsListResponse?) in
      completion(response)
    }
  }
}
