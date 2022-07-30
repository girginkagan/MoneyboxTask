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
    let isError = BehaviorRelay<BaseErrorModel?>(value: nil)
    let isLoading = BehaviorSubject<Bool>(value: false)
    let isLoggedIn = BehaviorSubject<Bool>(value: false)
    let emailViewModel = EmailViewModel()
    let passwordViewModel = PasswordViewModel()
    
    func validateCredentials() -> Bool {
        return emailViewModel.validateCredentials() && passwordViewModel.validateCredentials()
    }
    
    init(network: RestClient) {
        self.network = network
    }
    
    func setBindings() {
        emailViewModel.errorValue
            .bind(to: isError)
            .disposed(by: disposeBag)
        
        passwordViewModel.errorValue
            .bind(to: isError)
            .disposed(by: disposeBag)
        
        DataProvider.shared.user.asObservable()
            .map { $0 != nil }.bind(to: isLoggedIn)
            .disposed(by: disposeBag)
    }
    
    func login() {
        isLoading.onNext(true)
        network.postLogin(email: emailViewModel.data.value, password: passwordViewModel.data.value) { [weak self] success in
            DataProvider.shared.setNewUser(data: success)
            self?.isLoading.onNext(false)
        } errorCompletion: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.isError.accept(error)
        }
    }
}
