//
//  Container+API.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerServices() {
        autoregister(RestClient.self, initializer: RestClient.init).inObjectScope(.container)
    }
}
