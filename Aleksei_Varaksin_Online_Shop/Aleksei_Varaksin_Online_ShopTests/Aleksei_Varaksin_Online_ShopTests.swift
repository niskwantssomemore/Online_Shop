//
//  Aleksei_Varaksin_Online_ShopTests.swift
//  Aleksei_Varaksin_Online_ShopTests
//
//  Created by Aleksei Niskarav on 22/07/2020.
//  Copyright © 2020 Aleksei Niskarav. All rights reserved.
//

import XCTest
import Alamofire
@testable import Aleksei_Varaksin_Online_Shop

class Aleksei_Varaksin_Online_ShopTests: XCTestCase {
    
    var errorParser: ErrorParser!

    override func setUp() {
        super.setUp()
        errorParser = ErrorParser()
    }

    override func tearDown() {
        super.tearDown()
        errorParser = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLogin() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.login(userName: "test", password: "123456") { (response: DataResponse<LoginResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }
    
    func testLogout() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.logout(userId: 1) { (response: DataResponse<CommonResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }
    
    func testRegister() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.registerUser(userId: 1, userName: "test", password: "123456", email: "test@test.ru", gender: "Male", creditCard: "1234567887654321", bio: "Bio") { (response: DataResponse<RegisterResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }
    
    func testChangeUserData() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.changeUserData(userId: 1, userName: "test", password: "123456", email: "test@test.ru", gender: "Male", creditCard: "1234567887654321", bio: "Bio") { (response: DataResponse<CommonResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }
    
    func testGetProductsList() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.getProductsList(categoryId: 1) { (response: DataResponse<GetProductsListResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }
    
    func testGetProduct() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.getProduct(productId: 1) { (response: DataResponse<GetProductResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }
    
    func testGetReviews() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.getReviews(productId: 1) { (response: DataResponse<GetReviewsResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }
    
    func testAddReview() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.addReview(productId: 1, text: "5/5") { (response: DataResponse<CommonResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }
    
    func testDeleteReview() {
        let auth = Auth(errorParser: errorParser, sessionManager: SessionManager())
        auth.deleteReview(productId: 1) { (response: DataResponse<CommonResult>) in
            switch response.result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
            
        }
    }

}
