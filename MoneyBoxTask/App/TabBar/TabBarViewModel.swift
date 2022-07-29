//
//  TabBarViewModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Foundation

final class TabBarViewModel: BaseViewModel {
    private let services: RestClient
    var coordinator: TabBarCoordinator?
    
    init(services: RestClient) {
        self.services = services
    }
}
