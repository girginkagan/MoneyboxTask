//
//  ProductsTests.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import XCTest
@testable import MoneyBoxTask
import Mocker
import Alamofire

class ProductsTests: XCTestCase {
    func testOneOffPayment() {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = Session(configuration: configuration)

        let apiEndpoint = URL(string: "https://api-test02.moneyboxapp.com/investorproducts")!
        let requestExpectation = expectation(description: "Request should finish")

        let expectedUser = ProductsResponseModel(totalPlanValue: 15707.08)
        if let path = Bundle.main.path(forResource: "Accounts", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: data])
                mock.register()
            } catch {
                
            }
        }
        
        sessionManager
            .request(apiEndpoint)
            .responseDecodable(of: ProductsResponseModel.self) { (response) in
                XCTAssertNil(response.error)
                XCTAssertEqual(response.value, expectedUser)
                requestExpectation.fulfill()
            }.resume()

        wait(for: [requestExpectation], timeout: 10.0)
    }
}
