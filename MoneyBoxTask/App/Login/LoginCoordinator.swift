//
//  LoginCoordinator.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

final class LoginCoordinator: BaseCoordinator {
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = LoginViewController.instantiate()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        navigationController.setNavigationBarHidden(true, animated: false)
        
        navigationController.viewControllers = [viewController]
    }
}
