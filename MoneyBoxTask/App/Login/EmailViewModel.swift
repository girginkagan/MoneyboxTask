//
//  EmailViewModel.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/30/22.
//

import Foundation
import RxSwift
import RxCocoa

final class EmailViewModel: Validation {
    private var errorMessage: String = .local(.errorMail)
    
    var data: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var errorValue: BehaviorRelay<BaseErrorModel?> = BehaviorRelay<BaseErrorModel?>(value: nil)
    
    func validateCredentials() -> Bool {
        guard validatePattern(text: data.value) else {
            errorValue.accept(BaseErrorModel(errorCode: nil, message: errorMessage, errors: nil))
            return false
        }
        
        errorValue.accept(nil)
        return true
    }
    
    func validatePattern(text: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
}
