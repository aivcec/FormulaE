//
//  ThemeInitializer.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 21/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class ThemeInitializer: Initializable {
    
    func performInitialization(_ application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        UIView.appearance().tintColor = Constants.Colors.mainTint
    }
}
