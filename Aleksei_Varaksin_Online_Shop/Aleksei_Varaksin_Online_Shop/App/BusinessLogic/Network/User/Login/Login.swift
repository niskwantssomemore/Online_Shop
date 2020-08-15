//
//  Login.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct LoginRequest: RequestRouter {

  let baseURL: URL
  let login: String
  let password: String

  let method: HTTPMethod = .post
  let path: String = "login.json"
  var parameters: Parameters? {
    return [
      "username": login,
      "password": password
    ]
  }
}

protocol AuthService {
  func login(login: String, password: String, completion: @escaping (User?) -> Void)
}

class AuthServiceImplementation: AuthService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func login(login: String, password: String, completion: @escaping (User?) -> Void) {
    let request = LoginRequest(baseURL: baseURL, login: login, password: password)
    networkService.request(request) { (response: LoginResponse?) in
      completion(response?.user)
    }
  }
}
