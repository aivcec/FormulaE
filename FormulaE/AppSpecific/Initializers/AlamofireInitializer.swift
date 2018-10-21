//
//  AlamofireInitializer.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 19/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import Alamofire
import AlamofireNetworkActivityIndicator

class AlamofireInitializer: Initializable {

    func performInitialization(_ application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        let networkActivityManager = NetworkActivityIndicatorManager.shared
        networkActivityManager.isEnabled = true
        networkActivityManager.startDelay = 0        
    }
}
