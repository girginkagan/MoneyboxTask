//
//  PasswordViewModel.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/30/22.
//

import RxCocoa
import RxSwift

final class PasswordViewModel: Validation {
    var data: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var errorValue: BehaviorRelay<BaseErrorModel?> = BehaviorRelay<BaseErrorModel?>(value: nil)
    private var errorMessage: String = .local(.errorPassword)
    
    func validateCredentials() -> Bool {
        guard validateLength(text: data.value, minSize: 10) else {
            errorValue.accept(BaseErrorModel(errorCode: nil, message: errorMessage, errors: nil))
            return false
        }
        
        errorValue.accept(nil)
        return true
    }
    
    func validateLength(text : String, minSize: Int) -> Bool{
        return text.count >= minSize
    }
}
