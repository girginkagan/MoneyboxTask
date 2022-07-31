//
//  GetProductsApiRequest.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import Foundation

final class GetProductsApiRequest: BaseRequest {
    var headers: [String: String]?
    var requestBodyObject: Data?
    var requestMethod = RequestHttpMethod.get
    var requestPath: String = "investorproducts"
    
    init() {
        headers = baseAPIHeaders()
    }
}
