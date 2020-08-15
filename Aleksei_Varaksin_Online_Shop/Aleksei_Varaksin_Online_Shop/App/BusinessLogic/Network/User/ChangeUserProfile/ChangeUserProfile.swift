//
//  ChangeUserProfile.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 15.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

struct ChangeUserProfileRequest: RequestRouter {

  let baseURL: URL
  let data: UserProfileData

  let method: HTTPMethod = .post
  let path: String = "changeUserProfile"
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

protocol ChangeUserProfileService {
  func changeUserProfile(data: UserProfileData, completion: @escaping (ChangeUserProfileResponse?) -> Void)
}

class ChangeUserDataServiceImplementation: ChangeUserProfileService {

  let baseURL: URL
  let networkService: NetworkService

  init(
    baseURL: URL,
    networkService: NetworkService) {

    self.baseURL = baseURL
    self.networkService = networkService
  }

  func changeUserProfile(
    data: UserProfileData,
    completion: @escaping (ChangeUserProfileResponse?) -> Void) {
    let request = ChangeUserProfileRequest(
      baseURL: baseURL,
      data: data)
    networkService.request(request) { (response: ChangeUserProfileResponse?) in
      completion(response)
    }
  }
}
