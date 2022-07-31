//
//  ProductCoordinator.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/31/22.
//

import UIKit

final class ProductCoordinator: BaseCoordinator {
    private let viewModel: ProductViewModel
    
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = ProductViewController.instantiate()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func setData(data: ProductResponse?) {
        viewModel.selectedProduct = data
    }
    
    func presentSplash() {
        (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator.presentSplash()
    }
}
