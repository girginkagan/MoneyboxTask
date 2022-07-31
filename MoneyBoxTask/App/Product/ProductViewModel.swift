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
    var selectedProduct: ProductResponse?
    
    init(network: RestClient) {
        self.network = network
    }
    
    func setBindings() {
        
    }
}
