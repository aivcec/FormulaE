//
//  SessionInfo.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 21/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FBSDKCoreKit
import FBSDKLoginKit

struct SessionInfo {
    
    var isActiveSession: Bool {
        get {
            return FBSDKAccessToken.currentAccessTokenIsActive()
        }
    }
    
    var token: String? {
        get {
            return FBSDKAccessToken.current()?.tokenString
        }
    }
    
    var name: String {
        get {
            return FBSDKProfile.current()?.name ?? ""
        }
    }
    
    func stopSession() {
        FBSDKLoginManager().logOut()
    }
}
