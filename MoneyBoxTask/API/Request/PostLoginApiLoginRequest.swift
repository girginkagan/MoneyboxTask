//
//  PostLoginApiLoginRequest.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/30/22.
//

import Foundation

final class PostLoginApiRequest: BaseRequest {
    var headers: [String: String]?
    var requestBodyObject: Data?
    var requestMethod = RequestHttpMethod.post
    var requestPath: String = "users/login"
    
    init(email: String, password: String) {
        headers = baseAPIHeaders()
        
        let dataObject = LoginRequestModel(email: email, password: password)
        do {
            let jsonData = try JSONEncoder().encode(dataObject)
            requestBodyObject = jsonData
        } catch {
            print(error)
        }
    }
}
