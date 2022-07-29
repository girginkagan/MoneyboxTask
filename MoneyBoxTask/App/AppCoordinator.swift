//
//  AppCoordinator.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    override func start() {
        (UIApplication.shared.delegate as! AppDelegate).window = UIWindow(frame: UIScreen.main.bounds)
        (UIApplication.shared.delegate as! AppDelegate).window?.makeKeyAndVisible()
        presentSplash()
    }
    
    func presentSplash() {
        removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(SplashCoordinator.self)!
        start(coordinator: coordinator)
        
        guard let window = (UIApplication.shared.delegate as! AppDelegate).window else { return }
        ViewControllerUtil.setRootViewController(
            window: window,
            viewController: coordinator.navigationController,
            withAnimation: true)
    }
    
    func presentHome() {
        removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(TabBarCoordinator.self)!
        start(coordinator: coordinator)
        
        guard let window = (UIApplication.shared.delegate as! AppDelegate).window else { return }
        ViewControllerUtil.setRootViewController(
            window: window,
            viewController: coordinator.tabBarController,
            withAnimation: true)
    }
    
    func presentLogin() {
        removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(LoginCoordinator.self)!
        start(coordinator: coordinator)
        
        guard let window = (UIApplication.shared.delegate as! AppDelegate).window else { return }
        ViewControllerUtil.setRootViewController(
            window: window,
            viewController: coordinator.navigationController,
            withAnimation: true)
    }
}
