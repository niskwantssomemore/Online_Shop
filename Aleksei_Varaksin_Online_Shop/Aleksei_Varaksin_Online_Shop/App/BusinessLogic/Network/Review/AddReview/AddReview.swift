//
//  AddReview.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct AddReviewRequest: RequestRouter {

  let baseURL: URL
  let userID: Int
  let text: String

  let method: HTTPMethod = .post
  let path: String = "addReview"
  var parameters: Parameters? {
    return [
      "id_user": userID,
      "text": text
    ]
  }
}

protocol AddReviewService {
  func addReview(userID: Int, text: String, completion: @escaping (AddReviewResponse?) -> Void)
}

class AddReviewServiceImplementation: AddReviewService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func addReview(userID: Int, text: String, completion: @escaping (AddReviewResponse?) -> Void) {
    let request = AddReviewRequest(baseURL: baseURL, userID: userID, text: text)
    networkService.request(request) { (response: AddReviewResponse?) in
      completion(response)
    }
  }
}
