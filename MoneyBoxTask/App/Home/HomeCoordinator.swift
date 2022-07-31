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
        
        navigationController.navigationBar.tintColor = Color.color_primary.color
        navigationController.navigationBar.backgroundColor = Color.color_bg.color
        
        navigationController.viewControllers = [viewController]
    }
    
    func presentSplash() {
        (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator.presentSplash()
    }
    
    func presentProduct(data: ProductResponse?) {
        let coordinator = AppDelegate.container.resolve(ProductCoordinator.self)!
        coordinator.setData(data: data)
        startChild(coordinator: coordinator)
    }
}
