//
//  String+local.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Foundation

extension String {
    static func local(_ key: LocalizationKeys) -> String {
        return NSLocalizedString(key.rawValue, comment: "")
    }
    
    static func local(_ key: LocalizationKeys, _ value: CVarArg) -> String {
        return String(format: NSLocalizedString(key.rawValue, comment: ""), value)
    }
    
    static func local(_ key: LocalizationKeys, _ value: [CVarArg]) -> String {
        return String(format: NSLocalizedString(key.rawValue, comment: ""), arguments: value)
    }
}
