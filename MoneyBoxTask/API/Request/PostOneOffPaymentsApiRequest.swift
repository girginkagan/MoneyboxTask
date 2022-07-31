//
//  PostOneOffPaymentsApiRequest.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import Foundation

final class PostOneOffPaymentsApiRequest: BaseRequest {
    var headers: [String: String]?
    var requestBodyObject: Data?
    var requestMethod = RequestHttpMethod.post
    var requestPath: String = "oneoffpayments"
    
    init(amount: Int, inverstorProductId: Int) {
        headers = baseAPIHeaders()
        
        let dataObject = OneOffPaymentsRequestModel(amount: amount, investorProductID: inverstorProductId)
        do {
            let jsonData = try JSONEncoder().encode(dataObject)
            requestBodyObject = jsonData
        } catch {
            print(error)
        }
    }
}
