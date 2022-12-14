//
//  AppDelegate.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import UIKit
import Swinject
import RxCocoa
import SVProgressHUD
import RealmSwift
import Unrealm
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appCoordinator: AppCoordinator!
    static let container = Container()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureIQKeyboardManager()
        configureSVProgressHUD()
        
        Realm.registerRealmables(LoginResponseModel.self)
        Realm.registerRealmables(UserData.self)
        Realm.registerRealmables(ActionMessage.self)
        Realm.registerRealmables(Action.self)
        Realm.registerRealmables(Session.self)
        
        AppDelegate.container.registerDependencies()
        
        if CommandLine.arguments.contains("loggedout_uitesting") {
            DataProvider.shared.removeUser()
        }
        
        appCoordinator = AppDelegate.container.resolve(AppCoordinator.self)!
        appCoordinator.start()
        
        return true
    }
    
    private func configureIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
    
    private func configureSVProgressHUD() {
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
        SVProgressHUD.setBackgroundLayerColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2))
    }

}

