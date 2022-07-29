//
//  HomeCoordinator.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

final class HomeCoordinator: BaseCoordinator {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = HomeViewController.instantiate()
        viewController.tabBarItem.title = .local(.home)
        viewController.tabBarItem.image = Icon.ic_home_tab.image
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        navigationController.setNavigationBarHidden(true, animated: false)
        
        navigationController.viewControllers = [viewController]
    }
}
