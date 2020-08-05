//
//  ​AuthRequestFactory.swift
//  Aleksei_Varaksin_Online_Shop
//
//  Created by Aleksei Niskarav on 25/07/2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
    func logout(userId: Int, completionHandler: @escaping(DataResponse<CommonResult>) -> Void)
    func registerUser(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping(DataResponse<RegisterResult>) -> Void)
    func changeUserData(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping(DataResponse<CommonResult>) -> Void)
    func getProductsList(categoryId: Int, completionHandler: @escaping(DataResponse<GetProductsListResult>) -> Void)
    func getProduct(productId: Int, completionHandler: @escaping(DataResponse<GetProductResult>) -> Void)
    func getReviews(productId: Int, completionHandler: @escaping(DataResponse<GetReviewsResult>) -> Void)
    func addReview(productId: Int, text: String, completionHandler: @escaping(DataResponse<CommonResult>) -> Void)
    func deleteReview(productId: Int, completionHandler: @escaping(DataResponse<CommonResult>) -> Void)
}
