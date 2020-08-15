//
//  NetworkServiceFactory.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 13.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

class NetworkServiceFactory {

  private let baseUrl = URL(string: "http://localhost:8080/")!
  private let errorParser = ErrorParserImplementation()

  private(set) lazy var commonSessionManager: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpShouldSetCookies = false
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    let manager = SessionManager(configuration: configuration)
    return manager
  }()

  private(set) lazy var networkService = NetworkServiceImplementation(
    errorParser: errorParser,
    sessionManager: commonSessionManager
  )

  func makeAuthService() -> AuthService {
    return AuthServiceImplementation(baseURL: baseUrl, networkService: networkService)
  }

  func makeRegisterService() -> RegisterService {
    return RegisterServiceImplementation(baseURL: baseUrl, networkService: networkService)
  }

  func makeLogoutService() -> LogoutService {
    return LogoutServiceImplementation(baseURL: baseUrl, networkService: networkService)
  }

  func makeChangeUserDataService() -> ChangeUserProfileService {
    return ChangeUserDataServiceImplementation(baseURL: baseUrl, networkService: networkService)
  }

  func makeAddReviewService() -> AddReviewService {
    return AddReviewServiceImplementation(baseURL: baseUrl, networkService: networkService)
  }

  func makeApproveReviewService() -> ApproveReviewService {
    return ApproveReviewServiceImplementation(baseURL: baseUrl, networkService: networkService)
  }

  func makeRemoveReviewService() -> RemoveReviewService {
    return RemoveReviewServiceImplementation(baseURL: baseUrl, networkService: networkService)
  }
}
