//
//  LoginTests.swift
//  MoneyBoxTaskTests
//
//  Created by Kagan Girgin on 7/31/22.
//

import XCTest
@testable import MoneyBoxTask
import Mocker
import Alamofire

class LoginTests: XCTestCase {
    func testUserFetching() {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = Session(configuration: configuration)

        let apiEndpoint = URL(string: "https://api-test02.moneyboxapp.com/users/login")!
        let requestExpectation = expectation(description: "Request should finish")

        let expectedUser = LoginResponseModel(id: nil, userData: UserData(email: "test+ios@moneyboxapp.com", firstName: "Michael", lastName: "Jordan"), session: Session(bearerToken: "GuQfJPpjUyJH10Og+hS9c0ttz4q2ZoOnEQBSBP2eAEs="))
        if let path = Bundle.main.path(forResource: "LoginSucceed", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: data])
                mock.register()
            } catch {
                
            }
        }
        
        sessionManager
            .request(apiEndpoint)
            .responseDecodable(of: LoginResponseModel.self) { (response) in
                XCTAssertNil(response.error)
                XCTAssertEqual(response.value, expectedUser)
                requestExpectation.fulfill()
            }.resume()

        wait(for: [requestExpectation], timeout: 10.0)
    }
}
