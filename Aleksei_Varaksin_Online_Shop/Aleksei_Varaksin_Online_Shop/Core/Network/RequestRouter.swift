//
//  RequestRouter.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 13.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

enum RequestRouterEncoding {
  case url, json
}

protocol RequestRouter: URLRequestConvertible {

  var baseURL: URL { get }
  var method: HTTPMethod { get }
  var path: String { get }
  var parameters: Parameters? { get }
  var fullURL: URL { get }
  var encoding: RequestRouterEncoding { get }

}

extension RequestRouter {

  var fullURL: URL {
    return baseURL.appendingPathComponent(path)
  }

  var encoding: RequestRouterEncoding {
    return .url
  }

  func asURLRequest() throws -> URLRequest {
    var urlRequest = URLRequest(url: fullURL)
    urlRequest.httpMethod = method.rawValue

    switch self.encoding {
    case .url:
      return try URLEncoding.default.encode(urlRequest, with: parameters)
    case .json:
      return try JSONEncoding.default.encode(urlRequest, with: parameters)
    }
  }

}
