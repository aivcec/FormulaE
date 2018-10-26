//
//  LoginService.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 21/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FBSDKLoginKit

typealias EmptyCompletionBlock = () -> ()
typealias StringCompletionBlock = (String) -> ()

protocol LoginServiceProtocol {
    func peformLogin(from vc: UIViewController, onSuccess: @escaping EmptyCompletionBlock, onError: @escaping StringCompletionBlock)
}

class LoginService: LoginServiceProtocol {
    func peformLogin(from vc: UIViewController, onSuccess: @escaping EmptyCompletionBlock, onError: @escaping StringCompletionBlock) {
        let manager = FBSDKLoginManager()
        manager.logIn(withReadPermissions: ["public_profile", "email"], from: vc) { result, error in
            if let error = error {
                onError(error.localizedDescription)
            } else if let result = result, !result.isCancelled {
                FBSDKProfile.loadCurrentProfile(completion: { (profile, errors) in
                    if let error = error {
                        onError(error.localizedDescription)
                    }
                    onSuccess()
                })
                
            }
        }
    }
}
