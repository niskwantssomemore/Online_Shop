//
//  Logout.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct LogoutRequest: RequestRouter {

  let baseURL: URL
  let userID: Int

  let method: HTTPMethod = .post
  let path: String = "logout"
  var parameters: Parameters? {
    return [
      "id_user": userID
    ]
  }
}

protocol LogoutService {
  func logout(userID: Int, completion: @escaping (LogoutResponse?) -> Void)
}

class LogoutServiceImplementation: LogoutService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func logout(userID: Int, completion: @escaping (LogoutResponse?) -> Void) {
    let request = LogoutRequest(baseURL: baseURL, userID: userID)
    networkService.request(request) { (response: LogoutResponse?) in
      completion(response)
    }
  }
}
