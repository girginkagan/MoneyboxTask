//
//  HomeViewModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import RxSwift
import RxCocoa

final class HomeViewModel: BaseViewModel {
    private let network: RestClient
    var coordinator: HomeCoordinator?
    private let disposeBag = DisposeBag()
    let isError = BehaviorSubject<BaseErrorModel?>(value: nil)
    let isLoading = BehaviorSubject<Bool>(value: false)
    
    init(network: RestClient) {
        self.network = network
    }
    
    func setBindings() {
        
    }
}
