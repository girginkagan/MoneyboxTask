//
//  ProductViewModel.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import RxSwift
import RxCocoa

final class ProductViewModel: BaseViewModel {
    private let network: RestClient
    var coordinator: ProductCoordinator?
    private let disposeBag = DisposeBag()
    let isError = BehaviorSubject<BaseErrorModel?>(value: nil)
    let isLoading = BehaviorSubject<Bool>(value: false)
    let isOneOffPaymentDone = BehaviorSubject<Bool>(value: false)
    var selectedProduct: ProductResponse?
    
    init(network: RestClient) {
        self.network = network
    }
    
    func setOneOffPayment() {
        isLoading.onNext(true)
        network.postOneOffPayments(amount: 10, investorProductId: selectedProduct?.id ?? 0) { [weak self] success in
            self?.isOneOffPaymentDone.onNext(true)
            self?.isLoading.onNext(false)
            DataProvider.shared.reloadProducts.accept(true)
        } errorCompletion: { [weak self] error in
            self?.isError.onNext(error)
            self?.isLoading.onNext(false)
        }
    }
}
