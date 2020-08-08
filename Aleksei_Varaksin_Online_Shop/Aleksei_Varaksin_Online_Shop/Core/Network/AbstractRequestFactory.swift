//
//  AbstractRequestFactory.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 25/07/2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Foundation
import Alamofire

protocol AbstractRequestFactory {
    var errorParser: AbstractErrorParser { get }
    var sessionManager: SessionManager { get }
    var queue: DispatchQueue { get }

    @discardableResult
    func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping (DataResponse<T>) -> Void) -> DataRequest
}

extension AbstractRequestFactory {
    @discardableResult
    public func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping (DataResponse<T>) -> Void) -> DataRequest {
        return sessionManager.request(request).responseCodable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
    }
}
