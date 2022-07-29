//
//  LoginData.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Foundation
import Unrealm

struct LoginData: Codable, Realmable {
    var id: String?
    
    static func primaryKey() -> String? {
        return "id"
    }
}
