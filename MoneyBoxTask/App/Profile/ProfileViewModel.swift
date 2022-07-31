//
//  ProfileViewModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import RxSwift
import RxCocoa

final class ProfileViewModel: BaseViewModel {
    private let network: RestClient
    var coordinator: ProfileCoordinator?
    private let disposeBag = DisposeBag()
    
    init(network: RestClient) {
        self.network = network
    }
    
    func logout() {
        removeUser()
        
        coordinator?.presentSplash()
    }
}
