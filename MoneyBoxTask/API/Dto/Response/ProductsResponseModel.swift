//
//  ProductsResponseModel.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import Foundation

// MARK: - ProductsResponseModel
struct ProductsResponseModel: Codable, Equatable {
    static func == (lhs: ProductsResponseModel, rhs: ProductsResponseModel) -> Bool {
        lhs.totalPlanValue == rhs.totalPlanValue
    }
    
    var moneyboxEndOfTaxYear: String?
    var totalPlanValue, totalEarnings: Double?
    var totalContributionsNet: Double?
    var totalEarningsAsPercentage: Double?
    var productResponses: [ProductResponse]?
    var accounts: [Account]?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case moneyboxEndOfTaxYear = "MoneyboxEndOfTaxYear"
        case totalPlanValue = "TotalPlanValue"
        case totalEarnings = "TotalEarnings"
        case totalContributionsNet = "TotalContributionsNet"
        case totalEarningsAsPercentage = "TotalEarningsAsPercentage"
        case productResponses = "ProductResponses"
        case accounts = "Accounts"
        case message = "Message"
    }
}

// MARK: - Account
struct Account: Codable {
    var type, name, deepLinkIdentifier: String?
    var wrapper: Wrapper?
    var milestone: Milestone?
    var hasCollections: Bool?

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case name = "Name"
        case deepLinkIdentifier = "DeepLinkIdentifier"
        case wrapper = "Wrapper"
        case milestone = "Milestone"
        case hasCollections = "HasCollections"
    }
}

// MARK: - Milestone
struct Milestone: Codable {
    var initialStage, endStage: String?
    var endStageID: Int?

    enum CodingKeys: String, CodingKey {
        case initialStage = "InitialStage"
        case endStage = "EndStage"
        case endStageID = "EndStageId"
    }
}

// MARK: - Wrapper
struct Wrapper: Codable {
    var id, definitionGlobalID: String?
    var totalValue: Double?
    var totalContributions: Double?
    var earningsNet, earningsAsPercentage, maximumWithdrawal: Double?
    var returns: Returns?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case definitionGlobalID = "DefinitionGlobalId"
        case totalValue = "TotalValue"
        case totalContributions = "TotalContributions"
        case earningsNet = "EarningsNet"
        case earningsAsPercentage = "EarningsAsPercentage"
        case maximumWithdrawal = "MaximumWithdrawal"
        case returns = "Returns"
    }
}

// MARK: - Returns
struct Returns: Codable {
    var simple, lifetime: Double?

    enum CodingKeys: String, CodingKey {
        case simple = "Simple"
        case lifetime = "Lifetime"
    }
}

// MARK: - ProductResponse
struct ProductResponse: Codable {
    var id: Int?
    var assetBoxGlobalID: String?
    var planValue, moneybox, totalFees: Double?
    var totalCollection, fixedAllocationsTotal, subscriptionAmount: Double?
    var totalWeeklySubscriptionAmount: Double?
    var isSelected, isFavourite: Bool?
    var collectionDayMessage, wrapperID: String?
    var isCashBox: Bool?
    var pendingInstantBankTransferAmount: Double?
    var assetBox: AssetBox?
    var product: Product?
    var investorAccount: InvestorAccount?
    var personalisation: Personalisation?
    var contributions: Contributions?
    var moneyboxCircle: MoneyboxCircle?
    var isSwitchVisible: Bool?
    var state, dateCreated: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case assetBoxGlobalID = "AssetBoxGlobalId"
        case planValue = "PlanValue"
        case totalCollection = "TotalCollection"
        case fixedAllocationsTotal = "FixedAllocationsTotal"
        case moneybox = "Moneybox"
        case subscriptionAmount = "SubscriptionAmount"
        case totalWeeklySubscriptionAmount = "TotalWeeklySubscriptionAmount"
        case totalFees = "TotalFees"
        case isSelected = "IsSelected"
        case isFavourite = "IsFavourite"
        case collectionDayMessage = "CollectionDayMessage"
        case wrapperID = "WrapperId"
        case isCashBox = "IsCashBox"
        case pendingInstantBankTransferAmount = "PendingInstantBankTransferAmount"
        case assetBox = "AssetBox"
        case product = "Product"
        case investorAccount = "InvestorAccount"
        case personalisation = "Personalisation"
        case contributions = "Contributions"
        case moneyboxCircle = "MoneyboxCircle"
        case isSwitchVisible = "IsSwitchVisible"
        case state = "State"
        case dateCreated = "DateCreated"
    }
}

// MARK: - AssetBox
struct AssetBox: Codable {
    var title: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
    }
}

// MARK: - Contributions
struct Contributions: Codable {
    var status: String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
    }
}

// MARK: - InvestorAccount
struct InvestorAccount: Codable {
    var contributionsNet: Double?
    var earningsNet, earningsAsPercentage: Double?
    var todaysInterest: Double?

    enum CodingKeys: String, CodingKey {
        case contributionsNet = "ContributionsNet"
        case earningsNet = "EarningsNet"
        case earningsAsPercentage = "EarningsAsPercentage"
        case todaysInterest = "TodaysInterest"
    }
}

// MARK: - MoneyboxCircle
struct MoneyboxCircle: Codable {
    var state: String?

    enum CodingKeys: String, CodingKey {
        case state = "State"
    }
}

// MARK: - Personalisation
struct Personalisation: Codable {
    var quickAddDeposit: QuickAddDeposit?
    var hideAccounts: HideAccounts?

    enum CodingKeys: String, CodingKey {
        case quickAddDeposit = "QuickAddDeposit"
        case hideAccounts = "HideAccounts"
    }
}

// MARK: - HideAccounts
struct HideAccounts: Codable {
    var enabled, isHidden: Bool?
    var sequence: Int?

    enum CodingKeys: String, CodingKey {
        case enabled = "Enabled"
        case isHidden = "IsHidden"
        case sequence = "Sequence"
    }
}

// MARK: - QuickAddDeposit
struct QuickAddDeposit: Codable {
    var amount: Int?

    enum CodingKeys: String, CodingKey {
        case amount = "Amount"
    }
}

// MARK: - Product
struct Product: Codable {
    var id: Int?
    var globalID, name, categoryType, type: String?
    var friendlyName: String?
    var canWithdraw, canProportionatelySelldown: Bool?
    var productHexCode: String?
    var annualLimit, depositLimit: Double?
    var bonusMultiplier: Double?
    var minimumWeeklyDeposit, maximumWeeklyDeposit: Int?
    var documents: Documents?
    var state, wrapperDefinitionGlobalID: String?
    var lisa: Lisa?
    var interestRate: String?
    var interestRateAmount: Double?
    var fund: Fund?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case globalID = "GlobalId"
        case name = "Name"
        case categoryType = "CategoryType"
        case type = "Type"
        case friendlyName = "FriendlyName"
        case canWithdraw = "CanWithdraw"
        case canProportionatelySelldown = "CanProportionatelySelldown"
        case productHexCode = "ProductHexCode"
        case annualLimit = "AnnualLimit"
        case depositLimit = "DepositLimit"
        case bonusMultiplier = "BonusMultiplier"
        case minimumWeeklyDeposit = "MinimumWeeklyDeposit"
        case maximumWeeklyDeposit = "MaximumWeeklyDeposit"
        case documents = "Documents"
        case state = "State"
        case wrapperDefinitionGlobalID = "WrapperDefinitionGlobalId"
        case lisa = "Lisa"
        case interestRate = "InterestRate"
        case interestRateAmount = "InterestRateAmount"
        case fund = "Fund"
    }
}

// MARK: - Documents
struct Documents: Codable {
    var keyFeaturesURL: String?

    enum CodingKeys: String, CodingKey {
        case keyFeaturesURL = "KeyFeaturesUrl"
    }
}

// MARK: - Fund
struct Fund: Codable {
    var fundID: Int?
    var name: String?
    var isFundDMB: Bool?

    enum CodingKeys: String, CodingKey {
        case fundID = "FundId"
        case name = "Name"
        case isFundDMB = "IsFundDMB"
    }
}

// MARK: - Lisa
struct Lisa: Codable {
    var maximumBonus: Int?

    enum CodingKeys: String, CodingKey {
        case maximumBonus = "MaximumBonus"
    }
}

extension ProductsResponseModel: BaseResponseModel {
    var error: String? { message }
}
