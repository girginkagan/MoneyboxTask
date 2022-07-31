//
//  ProfileCoordinator.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

final class ProfileCoordinator: BaseCoordinator {
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = ProfileViewController.instantiate()
        viewController.tabBarItem.title = .local(.profile)
        viewController.tabBarItem.image = Icon.ic_profile_tab.image
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        navigationController.setNavigationBarHidden(true, animated: false)
        
        navigationController.viewControllers = [viewController]
    }
    
    func presentSplash() {
        (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator.presentSplash()
    }
}
