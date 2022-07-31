//
//  Container+ViewModels.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerViewModels() {
        autoregister(SplashViewModel.self, initializer: SplashViewModel.init)
        autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
        autoregister(LoginViewModel.self, initializer: LoginViewModel.init)
        autoregister(TabBarViewModel.self, initializer: TabBarViewModel.init)
        autoregister(ProfileViewModel.self, initializer: ProfileViewModel.init)
        autoregister(ProductViewModel.self, initializer: ProductViewModel.init)
    }
}
