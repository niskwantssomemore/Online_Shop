//
//  ​Auth.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 25/07/2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue
    let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    init(errorParser: AbstractErrorParser, sessionManager: SessionManager, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}

extension Auth {
    struct Login: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}

extension Auth {
    struct Logout: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let userId: Int
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
}

extension Auth {
    struct RegisterUser: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        
        let userId: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "username": login,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}

extension Auth {
    struct ChangeUserData: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
        let userId: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "username": login,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}

extension Auth {
    struct GetProductsList: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getProductsList.json"
        
        let categoryId: Int
        
      var parameters: Parameters? {
        return [
          "category_id": categoryId
        ]
      }
    }
}

extension Auth {
    struct GetProduct: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getProduct.json"
        
        let productId: Int
        
      var parameters: Parameters? {
        return [
          "product_id": productId
        ]
      }
    }
}

extension Auth {
    struct GetReviews: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getReviews.json"
        
        let productId: Int
        
      var parameters: Parameters? {
        return [
          "product_id": productId
        ]
      }
    }
}

extension Auth {
    struct AddReview: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"
        
        let productId: Int
        let text: String
        
      var parameters: Parameters? {
        return [
          "product_id": productId,
          "text": text
        ]
      }
    }
}

extension Auth {
    struct DeleteReview: ​RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteReview.json"
        
        let productId: Int
        
      var parameters: Parameters? {
        return [
          "product_id": productId
        ]
      }
    }
}

extension Auth: AuthRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (DataResponse<CommonResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func registerUser(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (DataResponse<RegisterResult>) -> Void) {
        let requesModel = RegisterUser(baseUrl: baseUrl, userId: userId, login: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requesModel, completionHandler: completionHandler)
    }
    
    func changeUserData(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (DataResponse<CommonResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl, userId: userId, login: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProductsList(categoryId: Int, completionHandler: @escaping (DataResponse<GetProductsListResult>) -> Void) {
        let requestModel = GetProductsList(baseUrl: baseUrl, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProduct(productId: Int, completionHandler: @escaping (DataResponse<GetProductResult>) -> Void) {
        let requestModel = GetProduct(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getReviews(productId: Int, completionHandler: @escaping (DataResponse<GetReviewsResult>) -> Void) {
        let requestModel = GetReviews(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addReview(productId: Int, text: String, completionHandler: @escaping (DataResponse<CommonResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, productId: productId, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteReview(productId: Int, completionHandler: @escaping (DataResponse<CommonResult>) -> Void) {
        let requestModel = DeleteReview(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
