//
//  AppDelegate.swift
//  MVVM
//
//  Created by kashif on 5/10/23.
//

import UIKit
import MobileCoreServices


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let apps = getInstalledApps()
        print(apps)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


//    import UIKit
    
    func getInstalledApps() -> [String] {
        var installedApps = [String]()
        let allApps = UIApplication.shared
        for app in allApps {
            if let bundle = app as? Bundle, let appName = bundle.displayName {
                installedApps.append(appName)
            }
        }
        return installedApps
    }
    
}

