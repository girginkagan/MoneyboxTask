//
//  OneOffPaymentsResponseModel.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import Foundation

// MARK: - OneOffPaymentsResponseModel
struct OneOffPaymentsResponseModel: Codable, Equatable {
    let moneybox: Int?

    enum CodingKeys: String, CodingKey {
        case moneybox = "Moneybox"
    }
}
