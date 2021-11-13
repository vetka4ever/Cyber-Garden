//
//  AppDelegate.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit
import RealmSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let realm = try! Realm()
        let user: Results<AuthGetRealm> = realm.objects(AuthGetRealm.self)
        
//        try! realm.write
//        {
//            realm.deleteAll()
//        }
        
        let navigationController: UINavigationController
        if user.count == 0
        {
            navigationController = UINavigationController(rootViewController: SignView())
        }
        else
        {
            navigationController = UINavigationController(rootViewController: MainScreen())
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    

    


}

