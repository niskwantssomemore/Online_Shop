//
//  RemoveReview.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct RemoveReviewRequest: RequestRouter {

  let baseURL: URL
  let reviewID: Int

  let method: HTTPMethod = .post
  let path: String = "removeReview"
  var parameters: Parameters? {
    return [
      "id_comment": reviewID
    ]
  }
}

protocol RemoveReviewService {
  func removeReview(reviewID: Int, completion: @escaping (RemoveReviewResponse?) -> Void)
}

class RemoveReviewServiceImplementation: RemoveReviewService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func removeReview(reviewID: Int, completion: @escaping (RemoveReviewResponse?) -> Void) {
    let request = RemoveReviewRequest(baseURL: baseURL, reviewID: reviewID)
    networkService.request(request) { (response: RemoveReviewResponse?) in
      completion(response)
    }
  }
}
