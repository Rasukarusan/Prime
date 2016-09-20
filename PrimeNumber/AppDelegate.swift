//
//  AppDelegate.swift
//  PrimeNumber
//
//  Created by 田中直登 on 2016/09/13.
//  Copyright © 2016年 NaotoTanaka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard: UIStoryboard = self.grabStoryboard()
        if let window = window {
            window.rootViewController = storyboard.instantiateInitialViewController()
            
        }
        
        
        
        self.window?.makeKeyAndVisible()
        return true
    }

    func grabStoryboard() -> UIStoryboard {
        var storyboard = UIStoryboard()
        let height = UIScreen.main.bounds.size.height
        
        
        if height == 667 {//iPhone6
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            print("選ばれたのはiPhone6でした")
            
        }else if height == 736 { //iPhone6 Plus
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            print("選ばれたのはiPhone6Plusでした")
            
        }else if height == 480 { //iPhone4s
            storyboard = UIStoryboard(name: "iPhone5s", bundle: nil)
            print("選ばれたのはiPhone4sでした")
            
        }else if height == 1024 { //iPad
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            
        }else { //iPhone5・5s・5c
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            print("選ばれたのはiPhone5sでした")
        }
        return storyboard
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

