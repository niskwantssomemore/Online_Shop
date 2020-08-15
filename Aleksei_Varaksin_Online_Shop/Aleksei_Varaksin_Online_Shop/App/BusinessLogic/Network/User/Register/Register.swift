//
//  Register.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct RegisterRequest: RequestRouter {

  let baseURL: URL
  let data: UserProfileData

  let method: HTTPMethod = .post
  let path: String = "register"
  var parameters: Parameters? {
    return [
      "id_user": data.userID,
      "username": data.login,
      "password": data.password,
      "email": data.email,
      "gender": data.gender,
      "credit_card": data.creditCardNumber,
      "bio": data.bio
    ]
  }
}

protocol RegisterService {
  func register(data: UserProfileData, completion: @escaping (RegisterResponse?) -> Void)
}

class RegisterServiceImplementation: RegisterService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func register(data: UserProfileData, completion: @escaping (RegisterResponse?) -> Void) {
    let request = RegisterRequest(baseURL: baseURL, data: data)
    networkService.request(request) { (response: RegisterResponse?) in
      completion(response)
    }
  }
}
