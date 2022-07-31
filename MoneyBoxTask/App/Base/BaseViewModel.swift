//
//  BaseViewModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

class BaseViewModel: NSObject {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let realmUtil = RealmUtil()
    
    func removeUser() {
        DataProvider.shared.removeUser()
    }
}
