//
//  LoginViewModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import RxSwift
import RxCocoa

final class LoginViewModel: BaseViewModel {
    private let network: RestClient
    var coordinator: LoginCoordinator?
    private let disposeBag = DisposeBag()
    let isError = BehaviorSubject<BaseErrorModel?>(value: nil)
    let isLoading = BehaviorSubject<Bool>(value: false)
    
    init(network: RestClient) {
        self.network = network
    }
    
    func setBindings() {
        
    }
}
