//
//  AppDelegate.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit
import FirebaseCore
import CoreLocation
import FirebaseCore
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        let start = TabBarNavigationViewController(tabBarFactory: TabBarViewControllerFactory(appDelegate: self))
        window?.rootViewController = start
        window?.makeKeyAndVisible()
        
        return true
    }

}

