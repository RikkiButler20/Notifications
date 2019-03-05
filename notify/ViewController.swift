//
//  ViewController.swift
//  notify
//
//  Created by Kayla Butler on 3/4/19.
//  Copyright © 2019 Kayla Butler. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().delegate = (self as! UNUserNotificationCenterDelegate)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
            guard granted else {// 1. Check if permission granted
            
            return
            }
            print("Permission granted: \(granted)")
            
            // 2. Attempt registration for remote notifications on the main thread
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        })
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerForPushNotifications()
        return true
    }


}

