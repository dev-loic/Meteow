//
//  AppDelegate.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        return true
    }
}

