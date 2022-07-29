//
//  BaseResponseModel.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Foundation

struct BaseResponseModel<T: Codable>: Codable {
    let successCode: Int?
    let message: String?
    let data: T?
}
