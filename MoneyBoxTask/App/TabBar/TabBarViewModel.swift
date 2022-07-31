//
//  TabBarViewModel.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Foundation

final class TabBarViewModel: BaseViewModel {
    private let network: RestClient
    var coordinator: TabBarCoordinator?
    
    init(network: RestClient) {
        self.network = network
    }
}
