//
//  DataProvider.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import RxSwift
import RxCocoa

final class DataProvider {
    var users = BehaviorRelay<LoginData?>(value: nil)
    private let disposeBag = DisposeBag()
    
    static let shared = DataProvider()
    
}
