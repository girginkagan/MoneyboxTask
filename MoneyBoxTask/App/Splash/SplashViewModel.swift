//
//  SplashViewModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit
import RxSwift
import RxCocoa

final class SplashViewModel: BaseViewModel {
    private let network: RestClient
    private let disposeBag = DisposeBag()
    var coordinator: SplashCoordinator?
    
    let isReady = BehaviorSubject<Bool>(value: false)
    let isError = BehaviorSubject<BaseErrorModel?>(value: nil)
    
    init(network: RestClient) {
        self.network = network
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            DataProvider.shared.users.accept(LoginData())
        }
    }
    
    func setBindings() {
        DataProvider.shared.users.asObservable()
            .map { $0 != nil }.bind(to: isReady)
            .disposed(by: disposeBag)
    }
}
