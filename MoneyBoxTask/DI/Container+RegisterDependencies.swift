//
//  Container+RegisterDependencies.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Swinject

extension Container {
    func registerDependencies() {
        registerCoordinators()
        registerViewModels()
        registerServices()
    }
}
