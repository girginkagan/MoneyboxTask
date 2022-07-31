//
//  LoginRequest.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/30/22.
//

import Foundation

struct LoginRequestModel: Codable {
    let email, password: String?
    
    enum CodingKeys: String, CodingKey {
        case email = "Email"
        case password = "Password"
    }
}
