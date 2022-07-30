//
//  DataProvider.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import RxSwift
import RxCocoa

final class DataProvider {
    var user = BehaviorRelay<LoginResponseModel?>(value: nil)
    private let disposeBag = DisposeBag()
    
    static let shared = DataProvider()
    
    func setNewUser(data: LoginResponseModel) {
        DataProvider.shared.user.accept(data)
        
        let realmUtil = RealmUtil()
        realmUtil.removeUser()
        realmUtil.setUser(data: data)
    }
    
    func removeUser() {
        DataProvider.shared.user.accept(nil)
        let realmUtil = RealmUtil()
        realmUtil.removeUser()
    }
}
