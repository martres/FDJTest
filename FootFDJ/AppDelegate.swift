//
//  AppDelegate.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootNavigationController = UINavigationController()
        let viewController = TeamListBuilder.build()
        rootNavigationController.setViewControllers([viewController], animated: false)
        
        window!.makeKeyAndVisible()
        window!.rootViewController = rootNavigationController
        return true
    }
}
