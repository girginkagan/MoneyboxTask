//
//  Container+Coordinators.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCoordinators() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(SplashCoordinator.self, initializer: SplashCoordinator.init)
        autoregister(HomeCoordinator.self, initializer: HomeCoordinator.init)
        autoregister(LoginCoordinator.self, initializer: LoginCoordinator.init)
        autoregister(TabBarCoordinator.self, initializer: TabBarCoordinator.init)
        autoregister(ProfileCoordinator.self, initializer: ProfileCoordinator.init)
    }
}
