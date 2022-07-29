//
//  TabBarCoordinator.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit

final class TabBarCoordinator: BaseCoordinator {
    private let viewModel: TabBarViewModel
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        tabBarController.tabBar.barTintColor = Color.color_tabbar_bg.color
        tabBarController.tabBar.tintColor = Color.color_primary.color
        tabBarController.tabBar.unselectedItemTintColor = Color.color_accent.color
        tabBarController.selectedIndex = 0
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = Color.color_tabbar_bg.color
        UITabBar.appearance().standardAppearance = tabBarAppearance

        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
        let homeCoordinator = AppDelegate.container.resolve(HomeCoordinator.self)!
        start(coordinator: homeCoordinator)
        
        let profileCoordinator = AppDelegate.container.resolve(ProfileCoordinator.self)!
        start(coordinator: profileCoordinator)
        
        tabBarController.viewControllers = [homeCoordinator.navigationController, profileCoordinator.navigationController]
    }
}
