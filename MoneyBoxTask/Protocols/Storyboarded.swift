//
//  Storyboarded.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

protocol Storyboarded {
    static var storyboard: AppStoryboard { get }
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        switch identifier {
        case AppStoryboard.splash.rawValue:
            let viewController = SplashViewController(nibName: identifier, bundle: nil) as! Self
            return viewController
        case AppStoryboard.home.rawValue:
            let viewController = HomeViewController(nibName: identifier, bundle: nil) as! Self
            return viewController
        case AppStoryboard.login.rawValue:
            let viewController = LoginViewController(nibName: identifier, bundle: nil) as! Self
            return viewController
        case AppStoryboard.profile.rawValue:
            let viewController = ProfileViewController(nibName: identifier, bundle: nil) as! Self
            return viewController
        case AppStoryboard.product.rawValue:
            let viewController = ProductViewController(nibName: identifier, bundle: nil) as! Self
            return viewController
        default:
            let viewController = SplashViewController(nibName: identifier, bundle: nil) as! Self
            return viewController
        }
    }
}
