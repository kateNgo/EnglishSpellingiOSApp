//
//  AppDelegate.swift
//  EnglishSpellingForKids
//
//  Created by phuong on 15/6/17.
//  Copyright © 2017 ppben. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        PPBWordService.words = PPBWordService.animal
        return true
    }

    

    
 

}

