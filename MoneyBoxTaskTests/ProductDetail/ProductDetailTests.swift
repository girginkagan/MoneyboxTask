//
//  ProductDetailTests.swift
//  MoneyBoxTaskTests
//
//  Created by Kagan Girgin on 7/31/22.
//

import XCTest
@testable import MoneyBoxTask
import Mocker
import Alamofire

class ProductDetailTests: XCTestCase {
    func testOneOffPayment() {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = Session(configuration: configuration)

        let apiEndpoint = URL(string: "https://api-test02.moneyboxapp.com/oneoffpayments")!
        let requestExpectation = expectation(description: "Request should finish")

        let expectedUser = OneOffPaymentsResponseModel(moneybox: 90)
        if let path = Bundle.main.path(forResource: "OneOffPaymentSucceed", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: data])
                mock.register()
            } catch {
                
            }
        }
        
        sessionManager
            .request(apiEndpoint)
            .responseDecodable(of: OneOffPaymentsResponseModel.self) { (response) in
                XCTAssertNil(response.error)
                XCTAssertEqual(response.value, expectedUser)
                requestExpectation.fulfill()
            }.resume()

        wait(for: [requestExpectation], timeout: 10.0)
    }
}
