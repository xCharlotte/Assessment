//
//  AppDelegate.swift
//  CollectData
//
//  Created by Charlotte Voskuilen on 03-01-17.
//  Copyright © 2017 Alpaca. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Alamofire.request("http://localhost:3000/").responseJSON { response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                if let hash = JSON as? [String: Any] {
                    print (hash)
                    
                    if let loggedIn = hash["user_logged_in"] as? Bool {
                        if loggedIn {
                            self.gebruikerIsIngelogd()
                        }
                        else {
                            self.gebruikerNietIngelogd()
                        }
                        
                    }
                }
                
                
            }
        }
        return true
    }
    
    
    func gebruikerIsIngelogd() {
        print ("De gebruiker mag er in")
    }
    
    func gebruikerNietIngelogd() {
        
    }


}

