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
        DataProvider.shared.user.accept(realmUtil.getUser())
        isReady.onNext(true)
    }
}
