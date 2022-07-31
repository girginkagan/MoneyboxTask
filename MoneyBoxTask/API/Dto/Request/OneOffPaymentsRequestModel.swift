//
//  OneOffPaymentsRequestModel.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import Foundation

// MARK: - OneOffPaymentsRequestModel
struct OneOffPaymentsRequestModel: Codable {
    let amount, investorProductID: Int?

    enum CodingKeys: String, CodingKey {
        case amount = "Amount"
        case investorProductID = "InvestorProductId"
    }
}
