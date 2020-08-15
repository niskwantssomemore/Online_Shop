//
//  ErrorParser.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 13.08.2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Alamofire

enum AppError: Error {
  case authenticationError
  case canceledRequest
  case clientError
  case serverError
  case unknownError
}

protocol ErrorParser {

  func parse(_ result: Error) -> AppError
  func parse(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult

}

class ErrorParserImplementation: ErrorParser {

  func parse(_ result: Error) -> AppError {
    let error = result as NSError
    switch error.code {
    case -999:
      return .canceledRequest
    case -1001, -1005, -1009:
      return .clientError
    default:
      return .unknownError
    }
  }

  func parse(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult {
    switch response.statusCode {
    case 200..<300:
      let dataIsEmpty = data == nil
      if dataIsEmpty {
        return .failure(AppError.serverError)
      } else {
        return .success
      }
    case 401, 403:
      return .failure(AppError.authenticationError)
    default:
      return .failure(AppError.unknownError)
    }
  }

}
