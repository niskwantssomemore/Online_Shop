//
//  ApproveReview.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct ApproveReviewRequest: RequestRouter {

  let baseURL: URL
  let reviewID: Int

  let method: HTTPMethod = .post
  let path: String = "approveReview"
  var parameters: Parameters? {
    return [
      "id_comment": reviewID
    ]
  }
}

protocol ApproveReviewService {
  func approveReview(reviewID: Int, completion: @escaping (ApproveReviewResponse?) -> Void)
}

class ApproveReviewServiceImplementation: ApproveReviewService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func approveReview(reviewID: Int, completion: @escaping (ApproveReviewResponse?) -> Void) {
    let request = ApproveReviewRequest(baseURL: baseURL, reviewID: reviewID)
    networkService.request(request) { (response: ApproveReviewResponse?) in
      completion(response)
    }
  }
}
