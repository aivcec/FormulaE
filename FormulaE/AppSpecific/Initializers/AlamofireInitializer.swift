//
//  AlamofireInitializer.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 19/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireNetworkActivityIndicator

class AlamofireInitializer: Initializable {
    
    func performInitialization() {
        let networkActivityManager = NetworkActivityIndicatorManager.shared
        networkActivityManager.isEnabled = true
        networkActivityManager.startDelay = 0        
    }
    
}
