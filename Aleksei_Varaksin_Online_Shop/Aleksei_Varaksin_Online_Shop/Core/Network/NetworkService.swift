//
//  NetworkService.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 13.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

protocol NetworkService {

  func request<T: Decodable>(
    _ request: URLRequestConvertible,
    completionHandler: @escaping (T?) -> Void)

}

class NetworkServiceImplementation: NetworkService {

  let errorParser: ErrorParser
  let sessionManager: SessionManager

  init(
    errorParser: ErrorParser,
    sessionManager: SessionManager) {

    self.errorParser = errorParser
    self.sessionManager = sessionManager
  }

  func request<T: Decodable>(
    _ request: URLRequestConvertible,
    completionHandler: @escaping (T?) -> Void) {

    sessionManager
      .request(request)
      .validate(errorParser.parse)
      .responseData { [weak self] resрonse in
        if let error = resрonse.error {
          guard let errorCause = self?.errorParser.parse(error) else { return }

          switch errorCause {
          case .canceledRequest:
            return
          case .clientError:
            return
          case .unknownError:
            return
          default:
            return
          }
        }

        do {
          let value = try JSONDecoder().decode(T.self, from: resрonse.result.value!)
          completionHandler(value)
        } catch {
          print(error)
          completionHandler(nil)
        }
    }
  }

}
