//
//  AppDelegate.swift
//  checkYourself
//
//  Created by kiera thomasson on 7/2/18.
//  Copyright © 2018 kiera thomasson. All rights reserved.
//

import UIKit
import SpotifyLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

//    Below is data that is not accessible from the info.plist
    var clientID = ""
    var clientSecret = ""
    
    func setDictionary() {
        guard let infoPlist = Bundle.main.infoDictionary
            else {
                _ = "could not get plist"
                return
        }
        
    
        clientID += infoPlist["CLIENT_ID"] as! String
        clientSecret += infoPlist["CLIENT_SECRET"] as! String
        
    }
    
    var redirectURL = URL(string: "check-yourself-login://callback/")
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool
    {
        print("about to configure spotify")
        
        setDictionary()
        
        SpotifyLogin.shared.configure(clientID: clientID , clientSecret: clientSecret , redirectURL: redirectURL!)
        print ("configured Spotify")
        
        return true
    }
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
//        let handled = SpotifyLogin.shared.applicationOpenURL(url) { (error) in }
//        return handled
//    }
    
    func open(scheme: String) {
        if let url = URL(string: scheme) {
            UIApplication.shared.open(url, options: [:], completionHandler: {
                (success) in
                print ("Open \(scheme): \(success)")
            })
        }
    }

//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

