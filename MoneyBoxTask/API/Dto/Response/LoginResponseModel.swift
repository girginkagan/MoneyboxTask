//
//  LoginResponseModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Foundation
import Unrealm

// MARK: - LoginResponseModel
struct LoginResponseModel: Codable, Realmable {
    var id: String? = String(Date().timeIntervalSinceNow)
    var userData: UserData?
    var session: Session?
    var actionMessage: ActionMessage?
    var informationMessage: String?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case userData = "User"
        case session = "Session"
        case actionMessage = "ActionMessage"
        case informationMessage = "InformationMessage"
        case message = "Message"
        case id
    }
    
    static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - ActionMessage
struct ActionMessage: Codable, Realmable {
    var id: String? = String(Date().timeIntervalSinceNow)
    var type, message: String?
    var actions: [Action]?

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case message = "Message"
        case actions = "Actions"
    }
    
    static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Action
struct Action: Codable, Realmable {
    var id: String? = String(Date().timeIntervalSinceNow)
    var label: String?
    var amount: Int?
    var type, animation: String?

    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case amount = "Amount"
        case type = "Type"
        case animation = "Animation"
    }
    
    static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Session
struct Session: Codable, Realmable {
    var id: String? = String(Date().timeIntervalSinceNow)
    var bearerToken, externalSessionID, sessionExternalID: String?
    var expiryInSeconds: Int?

    enum CodingKeys: String, CodingKey {
        case bearerToken = "BearerToken"
        case externalSessionID = "ExternalSessionId"
        case sessionExternalID = "SessionExternalId"
        case expiryInSeconds = "ExpiryInSeconds"
    }
    
    static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - UserData
struct UserData: Codable, Realmable {
    var userID: String?
    var hasVerifiedEmail, isPinSet: Bool?
    var amlStatus: String?
    var amlAttempts: Int?
    var roundUpMode, jisaRoundUpMode, investorProduct, registrationStatus: String?
    var jisaRegistrationStatus, directDebitMandateStatus, dateCreated, animal: String?
    var referralCode, intercomHmac, intercomHmaciOS, intercomHmacAndroid: String?
    var hasCompletedTutorial: Bool?
    var lastPayment, previousMoneyboxAmount: Int?
    var moneyboxRegistrationStatus, email, firstName, lastName: String?
    var mobileNumber: String?
    var roundUpWholePounds, doubleRoundUPS: Bool?
    var moneyboxAmount, investmentTotal: Int?
    var canReinstateMandate, directDebitHasBeenSubmitted, monthlyBoostEnabled: Bool?
    var monthlyBoostAmount, monthlyBoostDay, monthlyBoostInvestorProductID: Int?
    var restrictedDevice, emailTwoFactorEnabled: Bool?
    var cohort: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case hasVerifiedEmail = "HasVerifiedEmail"
        case isPinSet = "IsPinSet"
        case amlStatus = "AmlStatus"
        case amlAttempts = "AmlAttempts"
        case roundUpMode = "RoundUpMode"
        case jisaRoundUpMode = "JisaRoundUpMode"
        case investorProduct = "InvestorProduct"
        case registrationStatus = "RegistrationStatus"
        case jisaRegistrationStatus = "JisaRegistrationStatus"
        case directDebitMandateStatus = "DirectDebitMandateStatus"
        case dateCreated = "DateCreated"
        case animal = "Animal"
        case referralCode = "ReferralCode"
        case intercomHmac = "IntercomHmac"
        case intercomHmaciOS = "IntercomHmaciOS"
        case intercomHmacAndroid = "IntercomHmacAndroid"
        case hasCompletedTutorial = "HasCompletedTutorial"
        case lastPayment = "LastPayment"
        case previousMoneyboxAmount = "PreviousMoneyboxAmount"
        case moneyboxRegistrationStatus = "MoneyboxRegistrationStatus"
        case email = "Email"
        case firstName = "FirstName"
        case lastName = "LastName"
        case mobileNumber = "MobileNumber"
        case roundUpWholePounds = "RoundUpWholePounds"
        case doubleRoundUPS = "DoubleRoundUps"
        case moneyboxAmount = "MoneyboxAmount"
        case investmentTotal = "InvestmentTotal"
        case canReinstateMandate = "CanReinstateMandate"
        case directDebitHasBeenSubmitted = "DirectDebitHasBeenSubmitted"
        case monthlyBoostEnabled = "MonthlyBoostEnabled"
        case monthlyBoostAmount = "MonthlyBoostAmount"
        case monthlyBoostDay = "MonthlyBoostDay"
        case monthlyBoostInvestorProductID = "MonthlyBoostInvestorProductId"
        case restrictedDevice = "RestrictedDevice"
        case emailTwoFactorEnabled = "EmailTwoFactorEnabled"
        case cohort = "Cohort"
    }
    
    static func primaryKey() -> String? {
        return "userID"
    }
}

extension LoginResponseModel: BaseResponseModel {
    var error: String? { message }
}
