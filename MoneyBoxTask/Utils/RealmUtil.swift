//
//  RealmUtil.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import RealmSwift
import Unrealm
import RxSwift

final class RealmUtil {
    private let version: UInt64 = 1
    private let disposeBag = DisposeBag()
    
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: version, migrationBlock: migrate)
    }
    
    private func migrate(migration: Migration, oldVersion: UInt64) {
        /*migration.enumerateObjects(ofType: Class.className()) { oldSetting, newSetting in
            migration.enumerateObjects(ofType: Class.className()) { old, new in
                if  old!["smt"] as! Int == 3 {
                    newSetting!["smt"] = old!["smt"]
                }
            }
        }*/
    }
    func setUser(data: LoginResponseModel) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(data, update: .all)
        }
    }
    
    func getUser() -> LoginResponseModel? {
        let realm = try! Realm()
        let res = realm.objects(LoginResponseModel.self)
        return Array(res).first
    }
    
    func removeUser() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
