//
//  SplashCoordinator.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import RxSwift

final class SplashCoordinator: BaseCoordinator {
    private let viewModel: SplashViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = SplashViewController.instantiate()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        viewModel.isReady.bind { [weak self] data in
            if data {
                self?.presentMain()
                self?.viewModel.isReady.dispose()
            }
        }.disposed(by: disposeBag)
        
        navigationController.isNavigationBarHidden = true
        navigationController.viewControllers = [viewController]
    }
    
    private func presentMain() {
        if DataProvider.shared.users.value != nil {
            (parentCoordinator as? AppCoordinator)?.presentHome()
        } else {
            (parentCoordinator as? AppCoordinator)?.presentLogin()
        }
    }
}
