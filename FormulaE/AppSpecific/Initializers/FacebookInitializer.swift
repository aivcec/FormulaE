//
//  FacebookInitializer.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 21/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FBSDKCoreKit

class FacebookInitializer: Initializable {
    
    func performInitialization(_ application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
