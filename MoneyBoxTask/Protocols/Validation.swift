//
//  Validation.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/30/22.
//

import RxSwift
import RxCocoa

protocol Validation {
    var data: BehaviorRelay<String> { get set }
    var errorValue: BehaviorRelay<BaseErrorModel?> { get }
    func validateCredentials() -> Bool
}
